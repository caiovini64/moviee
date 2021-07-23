import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/infra/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/repositories/repositories.dart';

import '../../mocks.dart';

class MockUpcomingMoviesDatasource extends Mock
    implements IUpcomingMoviesDatasource {}

main() {
  late IUpcomingMoviesRepository repository;
  late IUpcomingMoviesDatasource datasource;

  setUp(() {
    datasource = MockUpcomingMoviesDatasource();
    repository = UpcomingMoviesRepository(datasource);
  });

  test('should return a list of movie model when calls the datasource',
      () async {
    when(() => datasource.getUpcomingMovies())
        .thenAnswer((_) async => kMovieModelList);
    final result = await repository.getUpcomingMovies();
    expect(result, Right(kMovieModelList));
    verify(() => datasource.getUpcomingMovies());
  });

  test(
      'should return a ServerFailure when calls to datasource throws a ServerException',
      () async {
    when(() => datasource.getUpcomingMovies()).thenThrow(ServerException());
    final result = await repository.getUpcomingMovies();
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getUpcomingMovies());
  });

  test(
      'should return a UnexpectedFailure when calls to datasource throws a UnexpectedException',
      () async {
    when(() => datasource.getUpcomingMovies()).thenThrow(UnexpectedException());
    final result = await repository.getUpcomingMovies();
    expect(result, Left(UnexpectedFailure()));
    verify(() => datasource.getUpcomingMovies());
  });
}

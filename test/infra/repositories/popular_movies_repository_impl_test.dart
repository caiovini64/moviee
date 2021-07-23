import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/infra/repositories/repositories.dart';

import '../../mocks.dart';

class MockPopularMoviesDatasource extends Mock
    implements IPopularMoviesDatasource {}

main() {
  late IPopularMoviesRepository repository;
  late IPopularMoviesDatasource datasource;

  setUp(() {
    datasource = MockPopularMoviesDatasource();
    repository = PopularMoviesRepository(datasource);
  });

  test('should return a list of movie model when calls the datasource',
      () async {
    when(() => datasource.getPopularMovies())
        .thenAnswer((_) async => kMovieModelList);
    final result = await repository.getPopularMovies();
    expect(result, Right(kMovieModelList));
    verify(() => datasource.getPopularMovies());
  });

  test(
      'should return a ServerFailure when calls to datasource throws a ServerException',
      () async {
    when(() => datasource.getPopularMovies()).thenThrow(ServerException());
    final result = await repository.getPopularMovies();
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getPopularMovies());
  });

  test(
      'should return a UnexpectedFailure when calls to datasource throws a UnexpectedException',
      () async {
    when(() => datasource.getPopularMovies()).thenThrow(UnexpectedException());
    final result = await repository.getPopularMovies();
    expect(result, Left(UnexpectedFailure()));
    verify(() => datasource.getPopularMovies());
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/infra/repositories/repositories.dart';

import '../../mocks.dart';

class MockNowPlayingMoviesDatasource extends Mock
    implements INowPlayingMoviesDatasource {}

main() {
  late INowPlayingMoviesRepository repository;
  late INowPlayingMoviesDatasource datasource;

  setUp(() {
    datasource = MockNowPlayingMoviesDatasource();
    repository = NowPlayingMoviesRepository(datasource);
  });

  test('should return a list of movie model when calls the datasource',
      () async {
    when(() => datasource.getNowPlayingMovies())
        .thenAnswer((_) async => kMovieModelList);
    final result = await repository.getNowPlayingMovies();
    expect(result, Right(kMovieModelList));
    verify(() => datasource.getNowPlayingMovies());
  });

  test(
      'should return a ServerFailure when calls to datasource throws a ServerException',
      () async {
    when(() => datasource.getNowPlayingMovies()).thenThrow(ServerException());
    final result = await repository.getNowPlayingMovies();
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getNowPlayingMovies());
  });
}

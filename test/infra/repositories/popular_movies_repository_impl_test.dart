import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
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
}

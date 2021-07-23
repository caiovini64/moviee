import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/infra/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/repositories/repositories.dart';

import '../../mocks.dart';

class MockTopRatedMoviesDatasource extends Mock
    implements ITopRatedMoviesDatasource {}

main() {
  late ITopRatedMoviesRepository repository;
  late ITopRatedMoviesDatasource datasource;

  setUp(() {
    datasource = MockTopRatedMoviesDatasource();
    repository = TopRatedMoviesRepository(datasource);
  });

  test('should return a list of movie model when calls the datasource',
      () async {
    when(() => datasource.getTopRatedMovies())
        .thenAnswer((_) async => kMovieModelList);
    final result = await repository.getTopRatedMovies();
    expect(result, Right(kMovieModelList));
    verify(() => datasource.getTopRatedMovies());
  });
}

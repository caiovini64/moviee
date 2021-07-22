import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviee/domain/entities/entities.dart';

import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/domain/usecases/usecases.dart';

import '../../mocks.dart';

class MockPopularMoviesRepository extends Mock
    implements IPopularMoviesRepository {}

void main() {
  late Usecase usecase;
  late IPopularMoviesRepository repository;

  setUp(() {
    repository = MockPopularMoviesRepository();
    usecase = GetPopularMoviesUsecase(repository);
  });

  test('should get a list of movies from the repository', () async {
    when(() => repository.getPopularMovies()).thenAnswer(
        (_) async => Right<Failure, List<MovieEntity>>(kMovieEntityList));
    final result = await usecase(NoParams());
    expect(result, Right(kMovieEntityList));
    verify(() => repository.getPopularMovies());
  });
}

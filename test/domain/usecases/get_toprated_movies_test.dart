import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/domain/usecases/usecases.dart';

import '../../mocks.dart';

class MockTopRatedMoviesRepository extends Mock
    implements ITopRatedMoviesRepository {}

void main() {
  late Usecase usecase;
  late ITopRatedMoviesRepository repository;

  setUp(() {
    repository = MockTopRatedMoviesRepository();
    usecase = GetTopRatedMoviesUsecase(repository);
  });

  test('should get a list of movies from the repository', () async {
    when(() => repository.getTopRatedMovies()).thenAnswer(
        (_) async => Right<Failure, List<MovieEntity>>(kMovieEntityList));
    final result = await usecase(NoParams());
    expect(result, Right(kMovieEntityList));
    verify(() => repository.getTopRatedMovies());
  });
}

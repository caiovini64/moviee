import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/domain/usecases/usecases.dart';

import '../../mocks.dart';

class MockNowPlayingMoviesRepository extends Mock
    implements INowPlayingMoviesRepository {}

void main() {
  late Usecase usecase;
  late INowPlayingMoviesRepository repository;

  setUp(() {
    repository = MockNowPlayingMoviesRepository();
    usecase = GetNowPlayingMoviesUsecase(repository);
  });

  test('should get a list of movies from the repository', () async {
    when(() => repository.getNowPlayingMovies()).thenAnswer(
        (_) async => Right<Failure, List<MovieEntity>>(kMovieEntityList));
    final result = await usecase(NoParams());
    expect(result, Right(kMovieEntityList));
    verify(() => repository.getNowPlayingMovies());
  });

  test('should return a Failure when dont succeed', () async {
    when(() => repository.getNowPlayingMovies()).thenAnswer(
        (_) async => Left<Failure, List<MovieEntity>>(ServerFailure()));
    final result = await usecase(NoParams());
    expect(result, Left(ServerFailure()));
    verify(() => repository.getNowPlayingMovies());
  });
}

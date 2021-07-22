import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/domain/usecases/usecases.dart';

import '../../mocks.dart';

class MockMovieRecommendationsRepository extends Mock
    implements IMovieRecommendationsRepository {}

class MovieEntityFake extends Fake implements MovieEntity {}

void main() {
  late GetMovieRecommendationsUsecase usecase;
  late IMovieRecommendationsRepository repository;

  setUpAll(() {
    registerFallbackValue(MovieEntityFake());
  });

  setUp(() {
    repository = MockMovieRecommendationsRepository();
    usecase = GetMovieRecommendationsUsecase(repository);
  });

  test(
      'Should returns recommendations for a given movie id from the repository',
      () async {
    when(() => repository.getMovieRecommendations(any())).thenAnswer(
        (_) async => Right<Failure, List<MovieEntity>>(kMovieEntityList));
    final result = await usecase(kMovieEntity);
    expect(result, Right(kMovieEntityList));
    verify(() => repository.getMovieRecommendations(any()));
  });
  test('Should returns a Failure when dont succeed', () async {
    when(() => repository.getMovieRecommendations(any())).thenAnswer(
        (_) async => Left<Failure, List<MovieEntity>>(ServerFailure()));
    final result = await usecase(kMovieEntity);
    expect(result, Left(ServerFailure()));
    verify(() => repository.getMovieRecommendations(any()));
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/domain/usecases/usecases.dart';

import '../../mocks.dart';

class MockMovieDetailsRepository extends Mock
    implements IMovieDetailsRepository {}

class MovieEntityFake extends Fake implements MovieEntity {}

void main() {
  late GetMovieDetailsUsecase usecase;
  late IMovieDetailsRepository repository;

  setUpAll(() {
    registerFallbackValue(MovieEntityFake());
  });

  setUp(() {
    repository = MockMovieDetailsRepository();
    usecase = GetMovieDetailsUsecase(repository);
  });

  test(
      'Should returns details of a movie for a given movie id from the repository',
      () async {
    when(() => repository.getMovieDetails(any()))
        .thenAnswer((_) async => Right<Failure, MovieEntity>(kMovieEntity));
    final result = await usecase(kMovieEntity);
    expect(result, Right(kMovieEntity));
    verify(() => repository.getMovieDetails(any()));
  });

  test('Should returns a Failure when dont succeed', () async {
    when(() => repository.getMovieDetails(any()))
        .thenAnswer((_) async => Left<Failure, MovieEntity>(ServerFailure()));
    final result = await usecase(kMovieEntity);
    expect(result, Left(ServerFailure()));
    verify(() => repository.getMovieDetails(any()));
  });
}

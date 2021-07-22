import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/infra/repositories/repositories.dart';

import '../../mocks.dart';

class MockMovieRecommendationsDatasource extends Mock
    implements IMovieRecommendationsDatasource {}

class MovieEntityFake extends Fake implements MovieEntity {}

void main() {
  late MovieRecommendationsRepository repository;
  late IMovieRecommendationsDatasource datasource;

  setUpAll(() {
    registerFallbackValue(MovieEntityFake());
  });

  setUp(() {
    datasource = MockMovieRecommendationsDatasource();
    repository = MovieRecommendationsRepository(datasource);
  });

  test('should return a list of movie model when calls the datasource',
      () async {
    when(() => datasource.getMovieRecommendations(any()))
        .thenAnswer((_) async => kMovieModelList);
    final result = await repository.getMovieRecommendations(kMovieEntity);
    expect(result, Right(kMovieModelList));
    verify(() => datasource.getMovieRecommendations(any()));
  });

  test(
      'should return a ServerFailure when calls to datasource throws a Server Exception',
      () async {
    when(() => datasource.getMovieRecommendations(any()))
        .thenThrow(ServerException());
    final result = await repository.getMovieRecommendations(kMovieEntity);
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getMovieRecommendations(any()));
  });
}

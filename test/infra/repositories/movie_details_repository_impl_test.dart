import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/infra/repositories/repositories.dart';

import '../../mocks.dart';

class MockMovieDetailsDatasource extends Mock
    implements IMovieDetailsDatasource {}

class MovieEntityFake extends Fake implements MovieEntity {}

void main() {
  late IMovieDetailsRepository repository;
  late IMovieDetailsDatasource datasource;

  setUpAll(() {
    registerFallbackValue(MovieEntityFake());
  });

  setUp(() {
    datasource = MockMovieDetailsDatasource();
    repository = MovieDetailsRepository(datasource);
  });

  test('should return a MovieDetailsModel when calls the datasource', () async {
    when(() => datasource.getMovieDetails(any()))
        .thenAnswer((_) async => kMovieDetailsModel);
    final result = await repository.getMovieDetails(kMovieEntity);
    expect(result, Right(kMovieDetailsModel));
    verify(() => datasource.getMovieDetails(any()));
  });

  test(
      'should return a ServerFailure when calls to datasource throws a ServerException',
      () async {
    when(() => datasource.getMovieDetails(any())).thenThrow(ServerException());
    final result = await repository.getMovieDetails(kMovieEntity);
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getMovieDetails(any()));
  });

  test(
      'should return a UnexpectedFailure when calls to datasource throws a UnexpectedException',
      () async {
    when(() => datasource.getMovieDetails(any()))
        .thenThrow(UnexpectedException());
    final result = await repository.getMovieDetails(kMovieEntity);
    expect(result, Left(UnexpectedFailure()));
    verify(() => datasource.getMovieDetails(any()));
  });
}

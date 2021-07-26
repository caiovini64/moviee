import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviee/external/datasources/datasources.dart';
import 'package:moviee/infra/client/clients.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/helpers.dart';
import 'package:moviee/infra/models/models.dart';

import '../../mocks.dart';

void main() {
  late IMovieDetailsDatasource datasource;
  late IConnectionClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = MovieDetailsDatasource(client);
  });

  void successMock() {
    when(() => client.get(any())).thenAnswer((_) async => HttpResponseModel(
          data: kMovieDetailsResponse,
          statusCode: 200,
        ));
  }

  // test('should calls the get method with the correct url', () async {
  //   successMock();
  //   await datasource.getMovieDetails(kMovieEntity);
  //   verify(() => client.get(TMDBEndpoints.movieDetails('1'))).called(1);
  // });

  test('should returns a MovieDetailsModel', () async {
    successMock();
    final result = await datasource.getMovieDetails(kMovieEntity);
    expect(result, isA<MovieDetailsModel>());
  });

  test('Should throws a UnexpectedException when the status code was 404',
      () async {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponseModel(data: kMovieDetailsResponse, statusCode: 404));
    expect(datasource.getMovieDetails(kMovieEntity),
        throwsA(isA<UnexpectedException>()));
  });

  test('Should throws a ServerException  when the status code was 401',
      () async {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponseModel(data: kMovieDetailsResponse, statusCode: 401));
    expect(datasource.getMovieDetails(kMovieEntity),
        throwsA(isA<ServerException>()));
  });
}

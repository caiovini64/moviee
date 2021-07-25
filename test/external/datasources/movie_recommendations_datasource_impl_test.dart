import 'package:moviee/external/datasources/datasources.dart';
import 'package:moviee/external/helpers/endpoints/endpoints.dart';
import 'package:moviee/infra/client/clients.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/infra/models/http_response_model.dart';
import 'package:moviee/infra/models/models.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late IMovieRecommendationsDatasource datasource;
  late IConnectionClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = MovieRecommendationsDatasource(client);
  });

  void successMock() {
    when(() => client.get(any())).thenAnswer((_) async => HttpResponseModel(
          data: kMoviesResponse,
          statusCode: 200,
        ));
  }

  test('Should calls the get method with the correct url', () async {
    successMock();
    await datasource.getMovieRecommendations(kMovieEntity);
    verify(() =>
            client.get(TMDBEndpoints.movieWithParams('recommendations', '1')))
        .called(1);
  });

  test('Should returns a List of MovieModel', () async {
    successMock();
    final result = await datasource.getMovieRecommendations(kMovieEntity);
    expect(result, isA<List<MovieModel>>());
  });

  test('Should throws a ServerException when the status code was 404',
      () async {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponseModel(data: kMovieDetailsResponse, statusCode: 404));
    expect(datasource.getMovieRecommendations(kMovieEntity),
        throwsA(isA<UnexpectedException>()));
  });

  test('Should throws a ServerException when the status code was 401',
      () async {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponseModel(data: kMovieDetailsResponse, statusCode: 401));
    expect(datasource.getMovieRecommendations(kMovieEntity),
        throwsA(isA<ServerException>()));
  });
}

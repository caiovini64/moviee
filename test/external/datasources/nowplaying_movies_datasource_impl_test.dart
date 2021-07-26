import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviee/external/datasources/datasources.dart';
import 'package:moviee/infra/client/clients.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/infra/models/http_response_model.dart';

import '../../mocks.dart';

void main() {
  late INowPlayingMoviesDatasource datasource;
  late IConnectionClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = NowPlayingMoviesDatasource(client);
  });

  // void successMock() {
  //   when(() => client.get(any())).thenAnswer((_) async => HttpResponseModel(
  //         data: kMoviesResponse,
  //         statusCode: 200,
  //       ));
  // }

  // test('Should calls the get method with the correct url', () async {
  //   successMock();
  //   await datasource.getNowPlayingMovies();
  //   verify(() => client.get(urlExpected)).called(1);
  // });

  test('Should throws a ServerException when the status code was 404',
      () async {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponseModel(data: kMoviesResponse, statusCode: 404));
    expect(
        datasource.getNowPlayingMovies(), throwsA(isA<UnexpectedException>()));
  });

  test('Should throws a ServerException when the status code was 401',
      () async {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponseModel(data: kMoviesResponse, statusCode: 401));
    expect(datasource.getNowPlayingMovies(), throwsA(isA<ServerException>()));
  });
}

import 'package:moviee/infra/datasources/datasources.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/external/datasources/datasources.dart';
import 'package:moviee/infra/models/models.dart';
import 'package:moviee/infra/client/connection_client.dart';

import '../../mocks.dart';

void main() {
  late IPopularMoviesDatasource datasource;
  late IConnectionClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = PopularMoviesDatasource(client);
  });

  // void successMock() {
  //   when(() => client.get(any())).thenAnswer((_) async => HttpResponseModel(
  //         data: kMoviesResponse,
  //         statusCode: 200,
  //       ));
  // }

  // test('Should calls the get method with the correct url', () async {
  //   successMock();
  //   await datasource.getPopularMovies();
  //   verify(() => client.get(urlExpected)).called(1);
  // });

  test('Should throws a ServerException when the status code was 404',
      () async {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponseModel(data: kMoviesResponse, statusCode: 404));
    expect(datasource.getPopularMovies(), throwsA(isA<UnexpectedException>()));
  });

  test('Should throws a ServerException when the status code was 401',
      () async {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponseModel(data: kMoviesResponse, statusCode: 401));
    expect(datasource.getPopularMovies(), throwsA(isA<ServerException>()));
  });
}

import 'dart:convert';

import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/external/helpers/helpers.dart';
import 'package:moviee/infra/client/clients.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/helpers.dart';
import 'package:moviee/infra/models/models.dart';

class MovieRecommendationsDatasource
    implements IMovieRecommendationsDatasource {
  final IConnectionClient client;
  MovieRecommendationsDatasource(this.client);

  @override
  Future<List<MovieModel>> getMovieRecommendations(MovieEntity movie) async {
    final response = await client.get(
        TMDBEndpoints.movieWithParams('recommendations', movie.id.toString()));
    if (response.statusCode == 200) {
      final movieList = <MovieModel>[];
      final json = jsonDecode(response.data);
      final movies = json['results'] as List;
      movies.forEach((element) {
        final movie = MovieModel.fromJson(element);
        movieList.add(movie);
      });
      return movieList;
    } else if (response.statusCode == 404) {
      throw UnexpectedException();
    } else {
      throw ServerException();
    }
  }
}

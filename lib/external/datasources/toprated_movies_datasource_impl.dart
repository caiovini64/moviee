import 'dart:convert';

import 'package:moviee/external/helpers/helpers.dart';
import 'package:moviee/infra/client/connection_client.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/infra/models/models.dart';

class TopRatedMoviesDatasource implements ITopRatedMoviesDatasource {
  final IConnectionClient client;
  TopRatedMoviesDatasource(this.client);

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await client.get(TMDBEndpoints.movieList('top_rated'));
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

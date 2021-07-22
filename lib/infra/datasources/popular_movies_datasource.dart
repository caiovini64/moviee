import 'package:moviee/infra/models/models.dart';

abstract class IPopularMoviesDatasource {
  Future<List<MovieModel>> getPopularMovies();
}

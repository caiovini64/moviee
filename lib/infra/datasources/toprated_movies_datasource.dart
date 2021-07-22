import 'package:moviee/infra/models/models.dart';

abstract class ITopRatedMoviesDatasource {
  Future<List<MovieModel>> getTopRatedMovies();
}

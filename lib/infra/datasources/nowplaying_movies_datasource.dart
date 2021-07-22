import 'package:moviee/infra/models/models.dart';

abstract class INowPlayingMoviesDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();
}

import 'package:moviee/infra/models/models.dart';

abstract class IUpcomingMoviesDatasource {
  Future<List<MovieModel>> getUpcomingMovies();
}

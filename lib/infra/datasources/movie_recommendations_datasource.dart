import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/infra/models/models.dart';

abstract class IMovieRecommendationsDatasource {
  Future<List<MovieModel>> getMovieRecommendations(MovieEntity movie);
}

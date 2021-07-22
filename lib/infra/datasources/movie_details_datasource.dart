import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/infra/models/models.dart';

abstract class IMovieDetailsDatasource {
  Future<MovieDetailsModel> getMovieDetails(MovieEntity movie);
}

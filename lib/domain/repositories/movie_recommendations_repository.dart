import 'package:dartz/dartz.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';

abstract class IMovieRecommendationsRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovieRecommendations(
      MovieEntity params);
}

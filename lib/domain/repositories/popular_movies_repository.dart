import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/entities/entities.dart';

abstract class IPopularMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}

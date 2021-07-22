import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/entities/entities.dart';

abstract class IUpcomingMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies();
}

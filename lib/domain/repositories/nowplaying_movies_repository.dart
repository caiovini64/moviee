import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/entities/entities.dart';

abstract class INowPlayingMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
}

import 'package:dartz/dartz.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';

abstract class IMovieDetailsRepository {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      MovieEntity movie);
}

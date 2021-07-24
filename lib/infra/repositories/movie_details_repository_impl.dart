import 'package:moviee/domain/helpers/failure/failure.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';

class MovieDetailsRepository implements IMovieDetailsRepository {
  final IMovieDetailsDatasource datasource;
  MovieDetailsRepository(this.datasource);

  @override
  Future<Either<Failure, MovieEntity>> getMovieDetails(
      MovieEntity movie) async {
    try {
      final result = await datasource.getMovieDetails(movie);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on UnexpectedException {
      return Left(UnexpectedFailure());
    }
  }
}

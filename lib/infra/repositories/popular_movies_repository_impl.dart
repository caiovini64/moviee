import 'package:moviee/domain/helpers/failure/failure.dart';
import 'package:moviee/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';

class PopularMoviesRepository implements IPopularMoviesRepository {
  final IPopularMoviesDatasource datasource;
  PopularMoviesRepository(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      final result = await datasource.getPopularMovies();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on UnexpectedException {
      return Left(UnexpectedFailure());
    }
  }
}

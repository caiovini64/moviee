import 'package:dartz/dartz.dart';

import 'package:moviee/domain/helpers/failure/failure.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/helpers.dart';

class TopRatedMoviesRepository implements ITopRatedMoviesRepository {
  final ITopRatedMoviesDatasource datasource;
  TopRatedMoviesRepository(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    try {
      final result = await datasource.getTopRatedMovies();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

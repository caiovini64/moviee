import 'package:moviee/domain/helpers/failure/failure.dart';
import 'package:moviee/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';

class UpcomingMoviesRepository implements IUpcomingMoviesRepository {
  final IUpcomingMoviesDatasource datasource;
  UpcomingMoviesRepository(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies() async {
    final result = await datasource.getUpcomingMovies();
    return Right(result);
  }
}

import 'package:moviee/domain/helpers/failure/failure.dart';
import 'package:moviee/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';

class MovieRecommendationsRepository
    implements IMovieRecommendationsRepository {
  final IMovieRecommendationsDatasource datasource;
  MovieRecommendationsRepository(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovieRecommendations(
      MovieEntity params) async {
    final result = await datasource.getMovieRecommendations(params);
    return Right(result);
  }
}

import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';

class GetMovieRecommendationsUsecase implements Usecase {
  final IMovieRecommendationsRepository repository;
  GetMovieRecommendationsUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.getMovieRecommendations(params);
  }
}

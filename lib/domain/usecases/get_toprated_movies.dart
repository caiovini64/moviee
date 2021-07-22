import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';

class GetTopRatedMoviesUsecase implements Usecase {
  final ITopRatedMoviesRepository repository;
  GetTopRatedMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.getTopRatedMovies();
  }
}

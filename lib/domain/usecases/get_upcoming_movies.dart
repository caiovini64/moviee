import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';

class GetUpcomingMoviesUsecase implements Usecase {
  final IUpcomingMoviesRepository repository;
  GetUpcomingMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.getUpcomingMovies();
  }
}

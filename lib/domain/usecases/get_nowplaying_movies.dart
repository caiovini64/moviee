import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';

class GetNowPlayingMoviesUsecase implements Usecase {
  final INowPlayingMoviesRepository repository;
  GetNowPlayingMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.getNowPlayingMovies();
  }
}

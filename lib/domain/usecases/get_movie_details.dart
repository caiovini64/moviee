import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';

class GetMovieDetailsUsecase implements Usecase {
  final IMovieDetailsRepository repository;
  GetMovieDetailsUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.getMovieDetails(params);
  }
}

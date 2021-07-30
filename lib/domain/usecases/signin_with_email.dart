import 'package:dartz/dartz.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';

class SignInWithEmailUsecase extends AuthUsecase {
  final IAuthenticationRepository repository;
  SignInWithEmailUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(
      {required String? email, required String password}) {
    return repository.signInWithEmail(email: email, password: password);
  }
}

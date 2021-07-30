import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviee/domain/helpers/failure/failure.dart';
import 'package:moviee/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';

class AuthenticationRepository extends IAuthenticationRepository {
  final IAuthenticationDatasource datasource;
  AuthenticationRepository(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
      {required String? email, required String password}) async {
    try {
      final result =
          await datasource.signInWithEmail(email: email, password: password);
      return Right(result);
    } on SigninException {
      return Left(SigninFailure());
    }
  }
}

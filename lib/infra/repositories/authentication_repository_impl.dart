import 'package:moviee/domain/helpers/failure/failure.dart';
import 'package:moviee/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';

class AuthenticationRepository extends IAuthenticationRepository {
  final IAuthenticationDatasource datasource;
  AuthenticationRepository(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
      {required String email, required String password}) async {
    final result =
        await datasource.signInWithEmail(email: email, password: password);
    return Right(result);
  }
}

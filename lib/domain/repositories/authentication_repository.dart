import 'package:dartz/dartz.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';

abstract class IAuthenticationRepository {
  Future<Either<Failure, UserEntity>> signInWithEmail(
      {required String? email, required String password});
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviee/domain/helpers/failure/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class AuthUsecase<Type, Params> {
  Future<Either<Failure, Type>> call(
      {required String? email, required String password});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

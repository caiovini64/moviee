import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/domain/usecases/usecases.dart';

import '../../mocks.dart';

class MockAuthRepository extends Mock implements IAuthenticationRepository {}

void main() {
  late AuthUsecase usecase;
  late IAuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = SignInWithEmailUsecase(repository);
  });

  test('should get a UserEntity from the repository', () async {
    when(() => repository.signInWithEmail(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Right(kUserEntity));
    final result =
        await usecase(email: kUserEntity.email, password: 'password');
    expect(result, Right(kUserEntity));
  });

  test('should return a Failure when dont succeed', () async {
    when(() => repository.signInWithEmail(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Left(ServerFailure()));
    final result =
        await usecase(email: kUserEntity.email, password: 'password');
    expect(result, Left(ServerFailure()));
  });
}

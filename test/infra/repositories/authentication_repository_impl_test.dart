import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviee/domain/helpers/failure/failures.dart';
import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/exceptions/exceptions.dart';
import 'package:moviee/infra/repositories/repositories.dart';

import '../../mocks.dart';

class MockAuthDatasource extends Mock implements IAuthenticationDatasource {}

void main() {
  late IAuthenticationRepository repository;
  late IAuthenticationDatasource datasource;

  setUp(() {
    datasource = MockAuthDatasource();
    repository = AuthenticationRepository(datasource);
  });

  test('should return a user model when calls the datasource', () async {
    when(() => datasource.signInWithEmail(
        email: any(named: 'email'),
        password: any(named: 'password'))).thenAnswer((_) async => kUserModel);
    final result = await repository.signInWithEmail(
        email: kUserEntity.email, password: '123');
    expect(result, Right(kUserModel));
  });

  test(
      'should return a SigninFailure when calls to datasource throws a SigninException',
      () async {
    when(() => datasource.signInWithEmail(
        email: any(named: 'email'),
        password: any(named: 'password'))).thenThrow(SigninException());
    final result = await repository.signInWithEmail(
        email: kUserEntity.email, password: '123');
    expect(result, Left(SigninFailure()));
  });
}

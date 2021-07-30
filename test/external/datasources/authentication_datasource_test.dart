import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviee/external/datasources/authentication_datasource_impl.dart';
import 'package:moviee/infra/models/models.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthenticationDatasource datasource;
  Firebase.initializeApp();

  setUp(() async {
    datasource = AuthenticationDatasource();
  });

  test('description', () async {
    final result = await datasource.signInWithEmail(
        email: 'email@gmail.com', password: 'emailemail');
    expect(
      result,
      UserModel(
        id: 'sw2jqmEHI5ga7bYvkpzyHz8dvKl2',
        email: 'email@gmail.com',
      ),
    );
  });
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/models/models.dart';

class AuthenticationDatasource implements IAuthenticationDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signInWithEmail(
      {required String? email, required String password}) async {
    final result = await _auth.signInWithEmailAndPassword(
        email: email ?? '', password: password);
    return UserModel(email: result.user?.email, id: result.user?.uid);
  }
}

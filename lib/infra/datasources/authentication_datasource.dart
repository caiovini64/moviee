import 'package:moviee/infra/models/models.dart';

abstract class IAuthenticationDatasource {
  Future<UserModel> signInWithEmail(
      {required String? email, required String password});
}

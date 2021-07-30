import 'package:moviee/infra/models/models.dart';

abstract class IAuthenticationDatasource {
  Future<UserModel> signInWithEmail({String email, String password});
}

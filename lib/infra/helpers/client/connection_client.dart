
import 'package:moviee/infra/models/models.dart';

abstract class IConnectionClient {
  Future<HttpResponseModel> get(String url);
  Future<HttpResponseModel> post(String url, {required Map<String, dynamic> body});
}
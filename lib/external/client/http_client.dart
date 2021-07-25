import 'package:moviee/infra/client/clients.dart';
import 'package:moviee/infra/models/models.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IConnectionClient {
  final client = http.Client();

  @override
  Future<HttpResponseModel> get(String url) async {
    final http.Response response = await client.get(Uri.parse(url));
    return HttpResponseModel(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponseModel> post(String url, {required Map<String, dynamic> body}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
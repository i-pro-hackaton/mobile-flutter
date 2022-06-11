import 'package:http/http.dart' as http;

// Basic class for sending http requests to certain api url
abstract class BasicApiService {
  final String apiUrlString;
  late final Uri _baseUrl;

  BasicApiService(this.apiUrlString) {
    _baseUrl = Uri.parse(apiUrlString);
  }

  Future<http.Response> post({
    required String method,
    required Map<String, String?> body,
    required Map<String, String> headers,
  }) async {
    var response =
        await http.post(_baseUrl.resolve(method), body: body, headers: headers);
    return response;
  }

  Future<http.Response> get({
    required String method,
    required Map<String, String> headers,
  }) async {
    var response = await http.get(_baseUrl.resolve(method), headers: headers);
    return response;
  }

  Future<http.Response> put({
    required String method,
    required Map<String, String> headers,
    required Map<String, String?> body,
  }) async {
    var response =
        await http.put(_baseUrl.resolve(method), headers: headers, body: body);
    return response;
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

enum HTTPMethod { get, post, put, delete }

Map<HTTPMethod, String> httpMethod = {
  HTTPMethod.get: 'GET',
  HTTPMethod.post: 'POST',
  HTTPMethod.put: 'PUT',
  HTTPMethod.delete: 'DELETE',
};

class AppService {
  static final _shared = AppService._();
  AppService._();

  final String _baseUrl = "http://62.171.153.127:3333/api/v1";

  factory AppService() {
    return _shared;
  }

  Future<http.Response> invoke({
    String path = '/',
    HTTPMethod method = HTTPMethod.get,
    Map<String, String> headers = const {'Content-Type': 'application/json'},
    Object? body,
    Map<String, String>? params,
  }) async {
    final req = http.Request(httpMethod[method]!, Uri.parse(_baseUrl + path));

    req.headers.addAll(headers);

    if (params != null) req.url.queryParameters.addAll(params);

    if (body != null) req.body = json.encode(body);

    try {
      final streamedResponse = await req.send();
      final res = await http.Response.fromStream(streamedResponse);
      return res;
    } catch (err) {
      throw Exception('Errore durante la chiamata al servizio: $err');
    }
  }
}

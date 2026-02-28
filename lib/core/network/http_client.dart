abstract class HttpClient {
  Future<HttpResponse> get(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});

  Future<HttpResponse> post(String path, {dynamic data, Map<String, dynamic>? headers});

  Future<HttpResponse> put(String path, {dynamic data, Map<String, dynamic>? headers});

  Future<HttpResponse> delete(String path, {Map<String, dynamic>? headers});
}

class HttpResponse {
  final int statusCode;
  final dynamic data;

  HttpResponse({required this.statusCode, required this.data});
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:minimalist_shopping_list/core/error/exceptions/exceptions.dart';
import 'package:minimalist_shopping_list/core/network/http_client.dart';

enum HttpMethod { get, post, put, delete }

class DioHttpClient implements HttpClient {
  final Dio dio;

  DioHttpClient(this.dio);

  @override
  Future<HttpResponse> delete(String path, {Map<String, dynamic>? headers}) async {
    return await _send(HttpMethod.delete, Uri.parse(path), headers ?? {}, null);
  }

  @override
  Future<HttpResponse> get(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    return await _send(HttpMethod.get, Uri.parse(path), headers ?? {}, queryParameters);
  }

  @override
  Future<HttpResponse> post(String path, {data, Map<String, dynamic>? headers}) async {
    return await _send(HttpMethod.post, Uri.parse(path), headers ?? {}, data);
  }

  @override
  Future<HttpResponse> put(String path, {data, Map<String, dynamic>? headers}) async {
    return await _send(HttpMethod.put, Uri.parse(path), headers ?? {}, data);
  }

  Future<HttpResponse> _send(HttpMethod method, Uri uri, Map<String, dynamic>? headers, dynamic body) async {
    try {
      final request = dio.request(
        uri.toString(),
        options: Options(method: method.name.toUpperCase(), headers: headers),
        data: body != null ? jsonEncode(body) : null,
      );

      return await request
          .then((response) {
            return HttpResponse(statusCode: response.statusCode ?? 0, data: response.data);
          })
          .catchError((e) {
            if (e is DioException) {
              if (e.type == DioExceptionType.connectionError) {
                throw NoConnectionException();
              }

              if (e.type == DioExceptionType.connectionTimeout ||
                  e.type == DioExceptionType.sendTimeout ||
                  e.type == DioExceptionType.receiveTimeout) {
                throw TimeoutException();
              }

              if (e.type == DioExceptionType.cancel) {
                throw CancelledException();
              }

              if (e.type == DioExceptionType.badResponse) {
                final status = e.response?.statusCode;
                final message = _extractApiMessage(e.response?.data) ?? 'An error occurred (status code: $status)';

                switch (status) {
                  case 400:
                    throw BadRequestException(message);

                  case 401:
                    throw UnauthorizedException();

                  case 403:
                    throw ForbiddenException();

                  case 404:
                    throw NotFoundException();

                  case 409:
                    throw ConflictException(message);

                  case 429:
                    throw TooManyRequestsException();

                  case 503:
                    throw ServiceUnavailableException();

                  case 500:
                  case 502:
                  case 504:
                    throw ServerException(message: message, code: status);

                  default:
                    throw ServerException(message: message, code: status);
                }
              }

              if (e.response == null) {
                throw NoConnectionException();
              }

              throw UnknownException(e.message);
            }

            throw e;
          });
    } catch (_) {
      throw UnknownException();
    }
  }

  String? _extractApiMessage(dynamic data) {
    if (data == null) return null;

    if (data is String) return data;

    if (data is Map) {
      return data['message'] ?? data['error'] ?? data['detail'] ?? data['title']?.toString();
    }

    return null;
  }
}

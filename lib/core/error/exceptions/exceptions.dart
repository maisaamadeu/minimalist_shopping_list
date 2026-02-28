class NoConnectionException implements Exception {}

class TimeoutException implements Exception {}

class CancelledException implements Exception {}

class ServerException implements Exception {
  final String? message;
  final int? code;

  ServerException({this.message, this.code});
}

class BadRequestException implements Exception {
  final String? message;
  BadRequestException([this.message]);
}

class UnauthorizedException implements Exception {}

class TokenExpiredException implements Exception {}

class ForbiddenException implements Exception {}

class NotFoundException implements Exception {}

class ConflictException implements Exception {
  final String? message;
  ConflictException([this.message]);
}

class TooManyRequestsException implements Exception {}

class ServiceUnavailableException implements Exception {}

class ParsingException implements Exception {
  final String? message;
  ParsingException([this.message]);
}

class CacheException implements Exception {
  final String? message;
  CacheException([this.message]);
}

class StorageException implements Exception {
  final String? message;
  StorageException([this.message]);
}

class UnknownException implements Exception {
  final String? message;
  UnknownException([this.message]);
}

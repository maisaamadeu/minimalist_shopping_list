import 'package:minimalist_shopping_list/core/error/exceptions/exceptions.dart';
import 'package:minimalist_shopping_list/core/error/failures/failures.dart';

Failure mapException(Object e) {
  if (e is NoConnectionException) return const NetworkFailure();
  if (e is TimeoutException) return const TimeoutFailure();
  if (e is CancelledException) return const CancelledFailure();
  if (e is BadRequestException) {
    return BadRequestFailure(message: e.message ?? 'Requisição inválida');
  }
  if (e is UnauthorizedException) return const UnauthorizedFailure();
  if (e is TokenExpiredException) return const SessionExpiredFailure();
  if (e is ForbiddenException) return const ForbiddenFailure();
  if (e is NotFoundException) return const NotFoundFailure();
  if (e is ConflictException) {
    return ConflictFailure(message: e.message ?? 'Conflito de dados');
  }
  if (e is TooManyRequestsException) return const TooManyRequestsFailure();
  if (e is ServiceUnavailableException) {
    return const ServiceUnavailableFailure();
  }
  if (e is ParsingException) {
    return ParsingFailure(message: e.message ?? 'Erro ao processar dados');
  }
  if (e is CacheException) return const CacheFailure();
  if (e is StorageException) return const StorageFailure();
  if (e is ServerException) {
    return ServerFailure(
      message: e.message ?? 'Erro no servidor',
      code: e.code,
    );
  }

  return const UnknownFailure();
}

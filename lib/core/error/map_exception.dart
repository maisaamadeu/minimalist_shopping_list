import 'package:minimalist_shopping_list/core/error/exceptions/exceptions.dart';
import 'package:minimalist_shopping_list/core/error/failures/failures.dart';

Failure mapException(Object e) {
  if (e is NoConnectionException) return const NetworkFailure();
  if (e is TimeoutException) return const TimeoutFailure();
  if (e is UnauthorizedException) return const UnauthorizedFailure();
  if (e is ForbiddenException) return const ForbiddenFailure();
  if (e is NotFoundException) return const NotFoundFailure();
  if (e is CacheException) return const CacheFailure();
  if (e is StorageException) return const StorageFailure();
  if (e is ServerException) {
    return ServerFailure(message: e.message ?? 'Erro no servidor');
  }

  return const UnknownFailure();
}

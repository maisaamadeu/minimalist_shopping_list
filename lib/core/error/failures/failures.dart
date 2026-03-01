import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Erro desconhecido'});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Sem conexão com a internet'});
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({super.message = 'Tempo de requisição esgotado'});
}

class CancelledFailure extends Failure {
  const CancelledFailure({super.message = 'Requisição cancelada'});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'Erro no servidor', super.code});
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({super.message = 'Requisição inválida'});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = 'Não autorizado'});
}

class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure({
    super.message = 'Sessão expirada. Faça login novamente',
  });
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({super.message = 'Acesso negado'});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Recurso não encontrado'});
}

class ConflictFailure extends Failure {
  const ConflictFailure({super.message = 'Conflito de dados'});
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure({
    super.message = 'Muitas requisições. Tente novamente mais tarde',
  });
}

class ServiceUnavailableFailure extends Failure {
  const ServiceUnavailableFailure({
    super.message = 'Serviço temporariamente indisponível',
  });
}

class ParsingFailure extends Failure {
  const ParsingFailure({super.message = 'Erro ao processar dados'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Erro ao acessar cache'});
}

class StorageFailure extends Failure {
  const StorageFailure({super.message = 'Erro de armazenamento'});
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
}

class BusinessRuleFailure extends Failure {
  const BusinessRuleFailure({required super.message});
}

class EmptyDataFailure extends Failure {
  const EmptyDataFailure({super.message = 'Nenhum dado encontrado'});
}

class ImageStorageFailure extends Failure {
  const ImageStorageFailure({required super.message});
}

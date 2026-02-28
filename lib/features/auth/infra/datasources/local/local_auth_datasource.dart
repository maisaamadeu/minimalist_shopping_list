import 'package:minimalist_shopping_list/features/auth/infra/models/session_model.dart';

abstract class LocalAuthDatasource {
  Future<void> saveSession(SessionModel session);
  Future<SessionModel?> getSession();
  Future<void> deleteSession();
  Future<void> updateSession(SessionModel session);
}

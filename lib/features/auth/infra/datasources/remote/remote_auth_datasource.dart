import 'package:minimalist_shopping_list/features/auth/infra/models/session_model.dart';

abstract class RemoteAuthDatasource {
  Future<SessionModel> signInWithEmailAndPassword(String email, String password);
  Future<SessionModel> signUpWithEmaildAndPassword(String name, String email, String password);
  Future<void> signOut();
}

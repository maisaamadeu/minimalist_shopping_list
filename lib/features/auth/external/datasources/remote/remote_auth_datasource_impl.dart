import 'package:minimalist_shopping_list/core/network/http_client.dart';
import 'package:minimalist_shopping_list/features/auth/infra/datasources/remote/remote_auth_datasource.dart';
import 'package:minimalist_shopping_list/features/auth/infra/models/session_model.dart';

class RemoteAuthDatasourceImpl implements RemoteAuthDatasource {
  final HttpClient client;

  RemoteAuthDatasourceImpl(this.client);

  @override
  Future<SessionModel> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<SessionModel> signUpWithEmaildAndPassword(String name, String email, String password) {
    // TODO: implement signUpWithEmaildAndPassword
    throw UnimplementedError();
  }
}

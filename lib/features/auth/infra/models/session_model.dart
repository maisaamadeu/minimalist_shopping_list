import 'package:minimalist_shopping_list/features/auth/domain/entities/session_entity.dart';
import 'package:minimalist_shopping_list/features/auth/infra/models/user_model.dart';

class SessionModel extends SessionEntity {
  SessionModel({required UserModel user}) : super(user: user);

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(user: UserModel.fromJson(json['user']));
  }

  Map<String, dynamic> toJson() {
    return {'user': (user as UserModel).toJson()};
  }
}

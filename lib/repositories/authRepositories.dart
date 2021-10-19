
import 'package:cats_warehouse_mentor/models/userCred.dart';
import 'package:cats_warehouse_mentor/services/authApiProvider.dart';

class AuthRepository {
  AuthApiProvider authApiProvider = AuthApiProvider();


  Future<UserCred> login(email, password) =>
      authApiProvider.login(email, password);
}

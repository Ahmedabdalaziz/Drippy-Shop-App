import 'package:drippydrop_app/feature/login/data/models/login_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepository {
  LoginRepository();

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        return LoginResponseModel(
          accessToken: response.session?.accessToken ?? '',
          refreshToken: response.session?.refreshToken ?? '',
        );
      } else {
        return LoginErrorModel(msg: 'Login failed: User is null');
      }
    } on AuthException catch (e) {
      return LoginErrorModel(msg: e.message);
    } catch (e) {
      return LoginErrorModel(msg: 'Unexpected error: $e');
    }
  }
}

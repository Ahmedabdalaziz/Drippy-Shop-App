import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

Future<void> saveAuthToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}

Future<void> saveRefreshToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('refresh_token', token);
}

Future<String?> getAuthToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token');
}

Future<String?> getRefreshToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('refresh_token');
}

Future<void> clearAuthTokens() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');
  await prefs.remove('refresh_token');
}

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> checkAndRefreshSession() async {
  final supabase = Supabase.instance.client;

  if (supabase.auth.currentSession == null) {
    return false;
  }

  final session = supabase.auth.currentSession!;
  final expiry = session.expiresAt;
  final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  if (expiry != null && expiry > now) {
    return true;
  }

  // التوكين خلص، نحاول نعمل refresh
  try {
    final refreshResult = await supabase.auth.refreshSession();
    return refreshResult.session != null;
  } catch (e) {
    // فشل التحديث، محتاج Login تاني
    return false;
  }
}

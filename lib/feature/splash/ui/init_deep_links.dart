import 'package:app_links/app_links.dart';
import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/token_functions.dart';
import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeepLinkHandler {
  static void initialize(BuildContext context) {
    final appLinks = AppLinks();

    appLinks.uriLinkStream.listen((Uri? uri) async {
      if (uri == null || uri.host != 'login-callback') return;

      final accessToken = _extractToken(uri.fragment, 'access_token');
      final refreshToken = _extractToken(uri.fragment, 'refresh_token');

      if (accessToken == null || refreshToken == null) {
        _showError(context, 'Invalid token callback');
        return;
      }

      final client = Supabase.instance.client;

      try {
        await client.auth.setSession(refreshToken);

        await saveAuthToken(accessToken);
        await saveRefreshToken(refreshToken);

        context.pushNamedAndRemoveUntil(Routing.home);
      } catch (e) {
        _showError(context, 'Login failed: ${e.toString()}');
      }
    });
  }

  static String? _extractToken(String fragment, String key) {
    try {
      return fragment
          .split('&')
          .firstWhere((e) => e.startsWith('$key='))
          .split('=')[1];
    } catch (_) {
      return null;
    }
  }

  static void _showError(BuildContext context, String message) {
    context.showAppSnackBar(message, icon: FontAwesomeIcons.circleExclamation);
  }
}

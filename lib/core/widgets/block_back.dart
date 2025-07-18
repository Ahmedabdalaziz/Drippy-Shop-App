import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BackBlocker extends StatelessWidget {
  final Widget child;

  const BackBlocker({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    DateTime? _lastBackPress;

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();

        if (_lastBackPress == null ||
            now.difference(_lastBackPress!) > const Duration(seconds: 2)) {
          _lastBackPress = now;
          context.showAppSnackBar(
            'Are You Want To Exit?',
            backgroundColor: context.colorScheme.primary,
            icon: FontAwesomeIcons.sadCry,
            duration: const Duration(seconds: 2),
          );
          return false;
        }

        return true;
      },
      child: child,
    );
  }
}

import 'package:drippydrop_app/core/DI/dependancy_injection.dart'
    show setUpGetIt;
import 'package:drippydrop_app/core/helper/constants.dart';
import 'package:drippydrop_app/drippy_drop_app.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiOverlayStyle, DeviceOrientation;
import 'package:supabase_flutter/supabase_flutter.dart' show Supabase;

import 'core/routing/app_routing.dart' show AppRouter;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpGetIt();

  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseKey,
  );

  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(DrippyDropApp(appRouter: AppRouter()));
}

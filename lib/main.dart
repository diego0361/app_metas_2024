import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiro_2024/app/app_widgets.dart';
import 'package:primeiro_2024/firebase_options.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FlutterError.onError = (FlutterErrorDetails details) {
        if (details.library == 'image resource service') {
          return;
        }
      };

      runApp(const AppWidget());
    },
    (Object error, StackTrace stack) {},
  );
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soundgrade/firebase_options.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/utils/camera.dart';
import 'package:soundgrade/auth/auth_gate.dart';
import 'package:provider/provider.dart';
import 'package:soundgrade/utils/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initCameras();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SoundGrade',
        theme:
            context.watch<ThemeNotifier>().isLightMode ? mainTheme : darkTheme,
        home: const AuthGate());
  }
}

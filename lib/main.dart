import 'package:flutter/material.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/utils/camera.dart';
import 'package:provider/provider.dart';
import 'package:soundgrade/utils/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initCameras();
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
      title: 'Material App',
      theme: context.watch<ThemeNotifier>().isLightMode ? mainTheme : darkTheme,
      home: const LoginPage(),
    );
  }
}

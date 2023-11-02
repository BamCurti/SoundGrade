import 'package:flutter/material.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/utils/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: mainTheme,
        darkTheme: darkTheme,
        home: const LoginPage());
  }
}

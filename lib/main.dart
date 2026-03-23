import 'package:flutter/material.dart';
import 'package:trip_assistant/features/auth/views/Login/login.dart';
import 'package:trip_assistant/utils/theme/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TripAssistantTheme.light,
      darkTheme: TripAssistantTheme.dark,
      home: const LoginPage(title: 'Trip Assistant'),
    );
  }
}
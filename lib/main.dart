import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:trip_assistant/features/auth/views/Login/login.dart';
import 'package:trip_assistant/utils/theme/theme.dart';
import 'package:trip_assistant/utils/theme/controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ThemeController>();
    
    return MaterialApp(
      title: 'Trip Assistant',
      debugShowCheckedModeBanner: false,
      themeMode: controller.themeMode,
      theme: TripAssistantTheme.light,
      darkTheme: TripAssistantTheme.dark,
      home: const LoginPage(title: 'Trip Assistant'),
    );
  }
}
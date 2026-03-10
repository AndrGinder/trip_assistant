import 'package:flutter/material.dart';
import 'package:trip_assistant/features/user/views/StartPage/startpage.dart';
import 'package:trip_assistant/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: TripAssistantTheme.light,
      darkTheme: TripAssistantTheme.dark,
      home: const StartPage(title: 'Trip Assistant'),
    );
  }
}
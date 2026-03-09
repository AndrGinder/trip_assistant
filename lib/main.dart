import 'package:flutter/material.dart';
import 'package:trip_assistant/app/StartPage/StartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const StartPage(title: 'Flutter Demo Home Page'),
    );
  }
}
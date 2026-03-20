import 'package:flutter/material.dart';
import 'package:trip_assistant/features/user/views/Login/login.dart';
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
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TripAssistantTheme.light,
      darkTheme: TripAssistantTheme.dark,
      home: const LoginPage(title: 'Trip Assistant'),
      // routes: {
      //   '/': (context) => const StartPage(title: "Trip Assistant"),
      //   '/signin': (context) => const LoginPage(title: 'Sign in'),
      //   '/signup': (context) => const SignUpPage(title: 'Sign up'),
      //   '/trips' : (context) => const TripsPage(title: 'My Trips'),
      //   '/trip/add' : (context) => const AddTripPage(title: 'Add new Trip'),
      //   '/trip/edit' : (context) => const EditTripPage(title: 'Edit Trip'),
      //   '/trip/{id}' : (context) => const TripPage(title: 'Edit Trip'),
      //   '/trip/item/{id}' : (context) => const TripPage(title: 'Edit Trip'),
      // },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_assistant/features/user/views/Login/login.dart';
import 'package:trip_assistant/features/user/views/SignUp/signup.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  void _navigateSignIn(){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const LoginPage(title: 'Sign In'),
      ),
    );
  }

  void _navigateSignUp(){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const SignUpPage(title: 'Sign Up'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Trip Assistant',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Assistant helps you to prepare all needed things for any trip',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Do you have an account? Sign in',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _navigateSignIn, 
                  child: Text('Sign in'),
                ),
                ElevatedButton(
                  onPressed: _navigateSignUp, 
                  child: Text('Sign up'),
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}
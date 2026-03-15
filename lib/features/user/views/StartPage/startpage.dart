import 'package:flutter/material.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 50,
        ),
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
                  onPressed: () => NavigationUtils.navigateToSignInPage(context), 
                  child: Text('Sign in'),
                ),
                ElevatedButton(
                  onPressed: () => NavigationUtils.navigateToSignUpPage(context), 
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
import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/common/widgets/theme_switch.dart';

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
        actions: [
          ThemeSwitch(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: BlockProperties.mediumPadding,
          vertical: BlockProperties.largePadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Trip Assistant',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: BlockProperties.smallPadding),
            Text(
              'Assistant helps you to prepare all needed things for any trip',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: BlockProperties.smallPadding),
            Text(
              'Do you have an account? Sign in',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: BlockProperties.smallPadding),
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
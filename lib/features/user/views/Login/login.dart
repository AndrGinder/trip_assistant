import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/utils/constants/userform.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 50, 
          horizontal: 25
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Welcome to Trip Assistant!\nYour personal travel companion.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              'Please sign in to continue',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5, 
                      horizontal: 10
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: EmailUtils.label,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return EmailUtils.emptyError;
                        }
                        if (!EmailUtils.regexValidator.hasMatch(value)) {
                          return EmailUtils.matchError;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5, 
                      horizontal: 10
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: PasswordUtils.label,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(PasswordUtils.regexFormatter),
                        LengthLimitingTextInputFormatter(PasswordUtils.maxLength),
                      ],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return PasswordUtils.emptyError;
                        }
                        if (value.length < PasswordUtils.minLength) {
                          return PasswordUtils.lengthError;
                        }
                        if (!PasswordUtils.regexValidator.hasMatch(value)) {
                          return PasswordUtils.matchError;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
                          NavigationUtils.back(context);
                          NavigationUtils.navigateToSignUpPage(context);
                        },
                        child: const Text("Sign up"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          NavigationUtils.navigateToUserTrips(context);
                        }
                      }, 
                      child: Text('Sign in')
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
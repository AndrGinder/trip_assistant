import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/utils/constants/form.dart';

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
          vertical: BlockProperties.largePadding, 
          horizontal: BlockProperties.mediumPadding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Welcome to Trip Assistant!\nYour personal travel companion.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: BlockProperties.mediumPadding),
            Text(
              textAlign: TextAlign.center,
              'Please sign in to continue',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: BlockProperties.mediumPadding),
            Form(
                key: _formKey,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: BlockProperties.thinPadding, 
                            horizontal: BlockProperties.smallPadding
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
                            vertical: BlockProperties.thinPadding, 
                            horizontal: BlockProperties.smallPadding
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
                        SizedBox(height: BlockProperties.thinPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            TextButton(
                              onPressed: () {
                                NavigationUtils.navigateBack(context);
                                NavigationUtils.navigateToSignUpPage(context);
                              },
                              child: const Text("Sign up"),
                            ),
                          ],
                        ),
                        SizedBox(height: BlockProperties.smallPadding),
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
                ),
            ),
          ],
        ),
      ),
    );
  }
}
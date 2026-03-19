import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/utils/constants/userform.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              'Please sign up to continue',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: BlockProperties.mediumPadding),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: NameUtils.label,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return NameUtils.emptyError;
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
                        labelText: 'Password',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(PasswordUtils.regexFormatter),
                        LengthLimitingTextInputFormatter(PasswordUtils.maxLength),
                      ],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < PasswordUtils.minLength) {
                          return 'Password must be at least '
                            '${PasswordUtils.minLength} characters long';
                        }
                        if (!PasswordUtils.regexValidator.hasMatch(value)) {
                          return 'Password must contain at least one uppercase letter, '
                            'one lowercase letter, one digit, and one special character';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: BlockProperties.thinPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account? "),
                      TextButton(
                        onPressed: () {
                          NavigationUtils.back(context);
                          NavigationUtils.navigateToSignInPage(context);
                        },
                        child: const Text("Sign in"),
                      ),
                    ],
                  ),
                  SizedBox(height: BlockProperties.smallPadding),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          NavigationUtils.back(context);
                          NavigationUtils.navigateToSignInPage(context);
                        }
                      },
                      child: Text('Sign up')
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
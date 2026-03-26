import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/common/widgets/theme_switch.dart';
import 'package:trip_assistant/features/auth/services/auth_service.dart';
import 'package:trip_assistant/utils/constants/form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

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
          vertical: BlockProperties.largePadding, 
          horizontal: BlockProperties.mediumPadding
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Please sign up to start',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: BlockProperties.mediumPadding),
              Form(
                key: _formKey,
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
                          onChanged: (value) => setState(() {
                            _email = value.trim();
                          }),
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
                          onChanged: (value) => setState(() {
                            _password = value.trim();
                          }), 
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
                              NavigationUtils.navigateBack(context);
                              NavigationUtils.navigateToSignInPage(context);
                            },
                            child: const Text("Sign in"),
                          ),
                        ],
                      ),
                      SizedBox(height: BlockProperties.smallPadding),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            try{
                              await authService.value
                                .createAccount(
                                  email: _email, 
                                  password: _password
                                );  

                              // ignore: use_build_context_synchronously
                              NavigationUtils.navigateBack(context);
                              
                              // ignore: use_build_context_synchronously
                              NavigationUtils.navigateToSignInPage(context);

                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(AuthUtils.snackSignIn)),
                              );
                            }
                            on FirebaseAuthException catch (e) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(
                                  e.message ?? AuthUtils.snackError
                                )),
                              );
                            }
                          }
                        },
                        child: Text('Sign up'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:trip_assistant/features/user/views/Login/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  void _navigateSignIn(){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const LoginPage(title: 'Sign In'),
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
          mainAxisAlignment: .center,
          children: [
            Text(
              'Sign up',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Full name'),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full name is required';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                  children: [
                      Text('Email'),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                  children: [
                      Text('Password'),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      else {
                        _navigateSignIn();
                      }
                    },
                    child: Text('Sign up')
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
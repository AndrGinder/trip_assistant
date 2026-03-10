import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/tripspage.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign in',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Form(
              child: Column(
                children: [
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      else{
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const TripsPage(title: 'My Trips'),
                          ),
                        );
                      }
                    }, 
                    child: Text('Sign in')
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
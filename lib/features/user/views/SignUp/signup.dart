import 'package:flutter/material.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            // Text("${_formKey.currentState}"),
            Text(
              'Sign up',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Fill an sign up form',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 25),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 5, 
                      horizontal: 10
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Full name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full name is required';
                          }
                          return null;
                        },
                      ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 5, 
                      horizontal: 10
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Processing Data')),
                        //   );
                        // }
                        // else {
                          NavigationUtils.navigateToSignInPage(context);
                        // }
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
import 'package:flutter/material.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _formKey = GlobalKey<FormState>();

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
              'Sign in',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Fill an sign in form',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 25),
            Form(
              child: Column(
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
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
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
                        // else{
                        NavigationUtils.navigateToUserTrips(context);
                        // }
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
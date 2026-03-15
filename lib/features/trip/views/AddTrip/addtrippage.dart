import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/tripspage.dart';

class AddTripPage extends StatefulWidget {
  const AddTripPage({
    super.key,
    required this.title
  });

  final String title;

  @override
  State<AddTripPage> createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  // final _formKey = GlobalKey<FormState>();

  void _navigateToTripsPage(){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const TripsPage(title: 'My Trips'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 10, 
          horizontal: 5
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Fill the general conditions of your trip",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 5),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Description',
                            hintText: 'Describe your trip in a few words',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Description is required';
                          //   }
                          //   return null;
                          // },
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Destination',
                            hintText: 'Where are you going?',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Full name is required';
                          //   }
                          //   return null;
                          // },
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Purpose',
                            hintText: 'What is the purpose of your trip?',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Full name is required';
                          //   }
                          //   return null;
                          // },
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Weather',
                        hintText: 'What is the expected weather during your trip?',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Email is required';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                    //   if (_formKey.currentState!.validate()) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(content: Text('Processing Data')),
                    //     );
                    //   }
                    //   else{
                      _navigateToTripsPage();
                      // }
                    }, 
                    child: Text('Submit')
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
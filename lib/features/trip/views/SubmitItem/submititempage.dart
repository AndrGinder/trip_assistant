import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/tripspage.dart';

class SubmitTripItemPage extends StatefulWidget {
  const SubmitTripItemPage({super.key, required this.title});

  //id of trip item

  final String title;

  @override
  State<SubmitTripItemPage> createState() => _SubmitTripItemPageState();
}

class _SubmitTripItemPageState extends State<SubmitTripItemPage> {
  //if

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'Edit Trip',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Give basic conditions of your trip',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Destination',
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
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Weather',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Email is required';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Use additional things?',
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

                      //edit selected trip

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
            //grid with trips
            //on pressed trip navigate to trip page

            //on floating action button pressed it navigates to add trip page

            //on item toggle show on screen delete area when to toggle
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // if app gets and save an validation image
          // then submits selected trip item
          // and navigates to trip page
        },
        tooltip: 'Check item',
        child: const Icon(Icons.check),
      ),
    );
  }
}
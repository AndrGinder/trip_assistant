import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/EditTrip/edittrippage.dart';
import 'package:trip_assistant/features/trip/views/Trip/trippage.dart';

class SubmitTripItemPage extends StatefulWidget {
  final String id;
  final String title;
  final String tripId;

  const SubmitTripItemPage({
    super.key, 
    required this.id, 
    required this.title,
    required this.tripId
  });

  @override
  State<SubmitTripItemPage> createState() => _SubmitTripItemPageState();
}

class _SubmitTripItemPageState extends State<SubmitTripItemPage> {
  // final _formKey = GlobalKey<FormState>();

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
            // Text(
            //   'Edit Trip',
            //   style: Theme.of(context).textTheme.headlineLarge,
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'Give basic conditions of your trip',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // const SizedBox(height: 10),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    // child: Image(
                    //   // image: AssetImage('assets/images/validation.png'),
                    //       decoration: InputDecoration(
                    //         border: UnderlineInputBorder(),
                    //         labelText: 'Destination',
                    //       ),
                    //       // validator: (value) {
                    //       //   if (value == null || value.isEmpty) {
                    //       //     return 'Full name is required';
                    //       //   }
                    //       //   return null;
                    //       // },
                    //     ),
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
          // Navigator.pushAndRemoveUntil(context, newRoute, predicate)
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => TripPage(
                id: widget.tripId,
                title: widget.title,
                conditionsId: "1",
              ),
            ),
          );
          // if app gets and save an validation image
          // then submits selected trip item
          // and navigates to trip page
        },
        tooltip: 'Submit Item',
        child: const Icon(Icons.check),
      ),
    );
  }
}
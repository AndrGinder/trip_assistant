import 'package:flutter/material.dart';

class TripPage extends StatefulWidget {
  //include id of a selected trip
  const TripPage({super.key, required this.id, required this.title});

  final String id;
  final String title;

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  //get selected trip by its id

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //there is displayed trip title 
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              //there is displayed trip title 
              'My Trips',
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            //if list is recently created all items are unchecked
            // else if some of items check they get checked (became less attractive and moves to end of list)

            //show preffered checked/unchecked items list
            //for every item show check/recheck evaluated button
            //if item is checked then show uncheck button

            //show edit trip floated button
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add new Trip',
        child: const Icon(Icons.add),
      ),
    );
  }
}
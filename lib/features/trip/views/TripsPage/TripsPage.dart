import 'package:flutter/material.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key, required this.title});

  final String title;

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {


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
            
            
            //grid with trips
            //on pressed trip navigate to trip page

            //on floating action button pressed it navigates to add trip page

            //on item toggle show on screen delete area when to toggle
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
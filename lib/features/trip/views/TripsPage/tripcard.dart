import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/Trip/trippage.dart';

class TripCard extends StatelessWidget {
  final String id;
  final String title;

  const TripCard({
    super.key, 
    required this.id, 
    required this.title
  });

  void _navigateToTripDetails(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => TripPage(
          id: id, 
          conditionsId: "1",
          title: title
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(id),
        onTap: (){
          _navigateToTripDetails(context);
        },
      ),
    );
  }
}
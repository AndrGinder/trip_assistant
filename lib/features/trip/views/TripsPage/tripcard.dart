import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/Trip/trippage.dart';

class TripCard extends StatelessWidget {
  final String id;
  final String description;

  const TripCard({
    super.key, 
    required this.id, 
    required this.description
  });

  void _navigateToTripDetails(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => TripPage(
          id: id, 
          conditionsId: "1",
          title: description
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(description),
        subtitle: Text(id),
        onTap: (){
          _navigateToTripDetails(context);
        },
      ),
    );
  }
}
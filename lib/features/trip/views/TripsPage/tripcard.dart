import 'package:flutter/material.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripCard extends StatelessWidget {
  final String id;
  final String description;

  const TripCard({
    super.key, 
    required this.id, 
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(description),
        subtitle: Text(id),
        onTap: () => NavigationUtils.navigateToTripPage(
          context, 
          id: id, 
          title: description, 
          conditionsId: "1"
        ),
      ),
    );
  }
}
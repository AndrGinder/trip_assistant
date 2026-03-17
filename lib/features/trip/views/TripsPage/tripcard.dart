import 'package:flutter/material.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripCard extends StatelessWidget {
  final String id;
  final String name;

  const TripCard({
    super.key, 
    required this.id, 
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(id),
        onTap: () => NavigationUtils.navigateToTripPage(
          context, 
          id: id, 
          title: name, 
          conditionsId: "1"
        ),
      ),
    );
  }
}
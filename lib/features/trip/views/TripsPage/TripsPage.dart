import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/tripcard.dart';
import 'package:trip_assistant/utils/constants/grid.dart';
import 'package:trip_assistant/utils/constants/trip.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

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
      body: GridView.builder(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MobileGrid.cols,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10
        ),
        itemCount: myTrips.length,
        itemBuilder: (context, index){
          final trip = myTrips[index];

          return TripCard(
            id: trip.id,
            description: trip.description,
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationUtils.navigateToAddTripPage(context),
        tooltip: 'Add new Trip',
        child: const Icon(Icons.add),
      ),
    );
  }
}
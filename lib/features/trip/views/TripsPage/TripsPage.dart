import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/tripcard.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key, required this.title});

  final String title;

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          GridView.builder(
            padding: EdgeInsets.all(5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Grid.mobile,
              crossAxisSpacing: BlockProperties.smallPadding,
              mainAxisSpacing: BlockProperties.mediumPadding
            ),
            itemCount: myTrips.length,
            itemBuilder: (context, index){
              final trip = myTrips[index];

              return Draggable<Trip>(
                data: trip, 
                onDragStarted: () => setState(() => _isDragging = true),
                onDraggableCanceled: (_, _) => setState(() => _isDragging = false),
                onDragEnd: (_) => setState(() => _isDragging = false),
                feedback: TripCard(
                  id: trip.id,
                  name: trip.name,
                ),
                childWhenDragging: TripCard(
                  id: trip.id,
                  name: trip.name,
                ),
                child: TripCard(
                  id: trip.id,
                  name: trip.name,
                ),
              );
            }
          ),

          if (_isDragging)
            Align(
              alignment: Alignment.bottomCenter,
              child: DragTarget<Trip>(
                onAcceptWithDetails: (details) {
                  final trip = details.data;
                  setState(
                    () => myTrips.removeWhere((t) => t.id == trip.id)
                  );
                },
                // align: Alignment.bottomCenter,
                builder: (context, candidateData, rejectedData) => Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  color: candidateData.isNotEmpty ? Colors.redAccent : Colors.blueGrey,
                  child: const Center(
                    child: Icon(Icons.delete),
                  ),
                ),
              )
            ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationUtils.navigateToAddTripPage(context),
        tooltip: 'Add new Trip',
        child: const Icon(Icons.add),
      ),
    );
  }
}
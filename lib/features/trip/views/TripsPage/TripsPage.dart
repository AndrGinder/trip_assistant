import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          ListView.builder(
            padding: EdgeInsets.all(BlockProperties.thinPadding),
            itemCount: myTrips.length,
            itemBuilder: (context, index){
              final trip = myTrips[index];

              return Draggable<Trip>(
                data: trip, 

                onDragStarted: () { 
                  HapticFeedback.lightImpact();
                  setState(() => _isDragging = true); 
                },
                onDraggableCanceled: (_, _) => setState(() => _isDragging = false),
                onDragEnd: (_) => setState(() => _isDragging = false),

                feedback: Material(
                  elevation: 12,
                  color: Colors.transparent,
                  child: Transform.scale(
                    scale: 1.05,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TripCard(
                        id: trip.id,
                        name: trip.name,
                      ),
                    ),
                  ),
                ),

                childWhenDragging: Opacity(
                  opacity: .0,
                  child: TripCard(id: trip.id, name: trip.name),
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
                  setState((){
                    myTrips.removeWhere((t) => t.id == trip.id);
                    _isDragging = false;
                  });
                },
                builder: (context, candidateData, rejectedData) 
                  => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueGrey,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
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
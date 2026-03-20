import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/features/trip/controllers/trips_page_controller.dart';
import 'package:trip_assistant/features/trip/servers/trip/filter_trips.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/tripcard.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripsPage extends StatefulWidget {
  final String title;
  final TripsPageController controller 
    = TripsPageController(
      filterTrips: FilterTripsService(),
    );

  TripsPage({
    super.key, 
    required this.title
  });

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  bool _isDragging = false;

  List<Trip> _trips = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  Future<void> _loadTrips() async {
    final data = await widget.controller.tripsPage();

    setState(() {
      _trips = data;
      _isLoading = false;
    });
  }

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
            itemCount: _trips.length,
            itemBuilder: (context, index){
              final trip = _trips[index];

              return _isLoading 
                ? const Center(child: CircularProgressIndicator())
                : Draggable<Trip>(
                data: trip, 

                onDragStarted: () { 
                  HapticFeedback.lightImpact();
                  _isDragging = true; 
                },
                onDraggableCanceled: (_, _) => _isDragging = false,
                onDragEnd: (_) => _isDragging = false,

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
                  child: TripCard(
                    id: trip.id, 
                    name: trip.name
                  ),
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
                  trips.removeWhere((t) => t.id == trip.id);

                  _isDragging = false;
                },
                builder: (context, candidateData, rejectedData) => AnimatedContainer(
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
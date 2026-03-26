import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/widgets/logout.dart';
import 'package:trip_assistant/features/auth/services/auth_service.dart';
import 'package:trip_assistant/features/trip/controllers/trip_controller.dart';
import 'package:trip_assistant/features/trip/models/trip.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/trip_card.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/utils/constants/dependencies.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripsPage extends StatefulWidget {
  final String title;

  final TripController controller = TripController(
    tripService: tripService,
    tripItemService: itemService,
  );

  TripsPage({super.key, required this.title});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  bool _isDragging = false;
  bool _isLoading = true;
  List<Trip> _trips = [];

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  Future<void> _loadTrips() async {
    final userId = authService.value.currentUser!.uid;
    final trips = await widget.controller.getTrips(userId: userId);

    setState(() {
      _trips = trips;
      _isLoading = false;
    });
  }

  Future<void> _deleteTrip(Trip trip) async {
    await widget.controller.deleteTripWithItems(trip);
    setState(() {
      _trips.removeWhere((t) => t.id == trip.id);
      _isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [LogoutButton()],
      ),
      body: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.all(BlockProperties.thinPadding),
                itemCount: _trips.length,
                itemBuilder: (context, index) {
                  final trip = _trips[index];

                  return LongPressDraggable<Trip>(
                    data: trip,
                    dragAnchorStrategy: pointerDragAnchorStrategy,
                    onDragStarted: () {
                      HapticFeedback.lightImpact();
                      setState(() => _isDragging = true);
                    },
                    onDraggableCanceled: (_, _) {
                      setState(() => _isDragging = false);
                    },
                    onDragEnd: (_) {
                      setState(() => _isDragging = false);
                    },
                    feedback: Material(
                      elevation: 12,
                      color: Colors.transparent,
                      child: Transform.scale(
                        scale: BlockProperties.scale,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TripCard(
                            id: trip.id,
                            name: trip.name,
                            isFeedback: true,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: TripCard(
                      id: trip.id,
                      name: trip.name,
                      isDragging: true,
                    ),
                    child: TripCard(
                      id: trip.id,
                      name: trip.name,
                    ),
                  );
                },
              ),
              if (_isDragging)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DragTarget<Trip>(
                    onAcceptWithDetails: (details) {
                      _deleteTrip(details.data);
                    },
                    builder: (context, candidateData, rejectedData) {
                      final isActive = candidateData.isNotEmpty;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.redAccent : Colors.blueGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Icon(
                            isActive ? Icons.delete_forever : Icons.delete_outline,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationUtils.navigateToAddTripPage(context),
        tooltip: 'Add new Trip',
        child: const Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/widgets/logout.dart';
import 'package:trip_assistant/features/trip/controllers/trips_page_controller.dart';
import 'package:trip_assistant/features/trip/repositories/deleteTrip/delete_trip.dart';
import 'package:trip_assistant/features/trip/repositories/filterTrip/filter_trips.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/trip_card.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripsPage extends StatefulWidget {
  final String title;

  final TripsPageController controller = TripsPageController(
    filterTripsService: FilterTrips(),
    deleteTripService: DeleteTrip(),
  );

  TripsPage({
    super.key,
    required this.title,
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
    final data = await widget.controller
      .loadTrips("user1");

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
        actions: [ LogoutButton() ],
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
                      onAcceptWithDetails: (details) async {
                        final trip = details.data;

                        await widget.controller.deleteTrip(trip.id);

                        setState(() {
                          _isDragging = false;
                          _trips.removeWhere((t) => t.id == trip.id);
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        final isActive = candidateData.isNotEmpty;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 80,
                          width: 80,
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isActive
                              ? Colors.redAccent
                              : Colors.blueGrey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Icon(
                              isActive
                                ? Icons.delete_forever
                                : Icons.delete_outline,
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
        onPressed: () =>
            NavigationUtils.navigateToAddTripPage(context),
        tooltip: 'Add new Trip',
        child: const Icon(Icons.add),
      ),
    );
  }
}
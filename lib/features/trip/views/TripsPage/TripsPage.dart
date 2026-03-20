import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/features/trip/controllers/trips_page_controller.dart';
import 'package:trip_assistant/features/trip/servers/trip/delete_trip.dart';
import 'package:trip_assistant/features/trip/servers/trip/filter_trips.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/tripcard.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripsPage extends StatefulWidget {
  final String title;

  final TripsPageController controller = TripsPageController(
    filterTripsService: FilterTripsService(),
    deleteTripService: DeleteTripService(),
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

      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                /// LIST
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
                      onDraggableCanceled: (_, __) {
                        setState(() => _isDragging = false);
                      },
                      onDragEnd: (_) {
                        setState(() => _isDragging = false);
                      },

                      /// FLOATING CARD
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

                      /// ORIGINAL PLACEHOLDER
                      childWhenDragging: TripCard(
                        id: trip.id,
                        name: trip.name,
                        isDragging: true,
                      ),

                      /// NORMAL CARD
                      child: TripCard(
                        id: trip.id,
                        name: trip.name,
                      ),
                    );
                  },
                ),

                /// DELETE AREA
                if (_isDragging)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: DragTarget<Trip>(
                      onAcceptWithDetails: (details) {
                        final trip = details.data;

                        setState(() {
                          _trips.removeWhere((t) => t.id == trip.id);
                          _isDragging = false;
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        final isActive = candidateData.isNotEmpty;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 80,
                          width: double.infinity,
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
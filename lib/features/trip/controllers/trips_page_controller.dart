import 'package:trip_assistant/features/trip/repositories/deleteTrip/i_delete_trip.dart';
import 'package:trip_assistant/features/trip/repositories/filterTrip/i_filter_trips.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class TripsPageController {
  final IFilterTrips filterTripsService;
  final IDeleteTrip deleteTripService;

  TripsPageController({
    required this.filterTripsService,
    required this.deleteTripService,
  });

  Future<List<Trip>> loadTrips({
    String userId = "user1"
  }) async {
    var trips = await filterTripsService
        .filterByUserId(userId: userId);

    return trips;
  }

  Future<String> deleteTripCard(
    String id
  ) async {
    await deleteTripService
      .deleteTrip(id: id);

    return id;
  }
}
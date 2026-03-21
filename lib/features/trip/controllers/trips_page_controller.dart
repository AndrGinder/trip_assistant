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

  Future<List<Trip>> tripsPage() async {
    var trips = await filterTripsService.filterTrips();
    return trips;
  }

  Future<List<Trip>> deleteTripById(String tripId) async {
    await deleteTripService.deleteTrip(id: tripId);
    var trips = await filterTripsService.filterTrips();
    return trips;
  }
}
import 'package:trip_assistant/features/trip/repositories/trip/i_filter_trips.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class TripsPageController {
  final IFilterTrips filterTrips;

  TripsPageController({
    required this.filterTrips,
  });

  Future<List<Trip>> tripsPage() async {
    var trips = await filterTrips.filterTrips();
    return trips;
  }
}
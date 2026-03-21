import 'package:trip_assistant/features/trip/repositories/filterTrip/i_filter_trips.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class FilterTripsService implements IFilterTrips {
  @override
  Future<List<Trip>> filterTrips() async {
  //   required String userId
  // }) async {
    List<Trip> myTrips = trips;
    return myTrips;
  }
}
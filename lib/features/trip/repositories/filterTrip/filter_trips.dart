import 'package:trip_assistant/features/trip/repositories/filterTrip/i_filter_trips.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
import 'package:trip_assistant/utils/constants/models.dart';
// import 'package:trip_assistant/utils/constants/trip.dart';

class FilterTrips implements IFilterTrips {
  TripService service = TripService();

  @override
  Future<List<Trip>> filterByUserId() async {
    return await service.filter();

    //local api
    // List<Trip> myTrips = trips
    //   .where((trip) => trip.userId == userId)
    //   .toList();
      
    // return myTrips;
  }
}
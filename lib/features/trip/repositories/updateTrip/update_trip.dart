import 'package:trip_assistant/features/trip/repositories/updateTrip/i_update_trip.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class EditTrip implements IUpdateTrip {
  @override
  Future<String> updateTrip({
    required String id,
    required String name,
    required String destination,
    required String purpose,
    required String weather,
  }) async {
    Trip trip = trips
      .firstWhere((trip) => trip.id == id);

    trips.removeWhere((trip) => trip.id == id);
      
    trip.name = name;
    trip.destination = destination;
    trip.purpose = purpose;
    trip.weather = weather;

    trips.add(trip);

    return trip.id;
  }
}
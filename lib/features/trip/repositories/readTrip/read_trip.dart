import 'package:trip_assistant/features/trip/repositories/readTrip/i_read_trip.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class ReadTrip implements IReadTrip {
  @override
  Future<Trip> readById({
    required String id
  }) async {
    Trip trip = trips
      .firstWhere((trip) => trip.id == id);
      
    return trip;
  }
}
import 'package:trip_assistant/features/trip/repositories/trip/i_read_trip.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class ReadTrip implements IReadTrip {
  @override
  Future<Trip> readTrip({
    required String id
  }) async {
    // Implementation for reading a trip
    throw UnimplementedError();
  }
}
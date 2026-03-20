import 'package:trip_assistant/features/trip/repositories/trip/i_add_trip.dart';

class AddTrip implements IAddTrip {
  @override
  Future<String> addTrip({
    required String description,
  }) async {
    // Implementation for adding a trip
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    return id;
  }
}
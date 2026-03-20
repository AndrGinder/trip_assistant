import 'package:trip_assistant/features/trip/repositories/trip/i_edit_trip.dart';

class EditTrip implements IEditTrip {
  @override
  Future<String> editTrip({
    required String id,
    required String description,
  }) async {
    // Implementation for editing a trip
    return id;
  }
}
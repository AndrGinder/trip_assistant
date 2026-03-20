import 'package:trip_assistant/features/trip/repositories/tripCondition/i_add_trip_condition.dart';

class AddTripCondition implements IAddTripCondition {
  @override
  Future<String> addTripCondition({
    required String tripId,
    required String destination,
    required String purpose,
    required String weather,
  }) async {
    // Implementation for adding a trip
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    return id;
  }
}
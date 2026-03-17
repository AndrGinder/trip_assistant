import 'package:trip_assistant/features/trip/repositories/trip/IAddTrip.dart';

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
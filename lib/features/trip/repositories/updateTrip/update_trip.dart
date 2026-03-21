import 'package:trip_assistant/features/trip/repositories/updateTrip/i_update_trip.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class UpdateTrip implements IUpdateTrip {
  @override
  Future<String> updateRecord({
    required String id,
    required String name,
    required String destination,
    required String purpose,
    required String weather,
  }) async {
    final index = trips.indexWhere((trip) => trip.id == id);

    if (index != -1) {
      trips[index]
        ..name = name
        ..destination = destination
        ..purpose = purpose
        ..weather = weather;
    }

    return id;
  }
}
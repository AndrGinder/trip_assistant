import 'package:trip_assistant/features/trip/repositories/updateTrip/i_update_trip.dart';

class UpdateTripPageController {
  final IUpdateTrip updateTripService;

  UpdateTripPageController({
    required this.updateTripService,
  });

  Future<String> updateTrip({
    required String id,
    required String name,
    required String destination,
    required String purpose,
    required String weather
  }) async {
    var tripId = await updateTripService
      .updateRecord(
        id: id,
        name: name,
        destination: destination,
        purpose: purpose,
        weather: weather,
      );

    return tripId;
  }
}
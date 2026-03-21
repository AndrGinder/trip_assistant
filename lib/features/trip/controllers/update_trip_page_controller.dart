import 'package:trip_assistant/features/trip/repositories/readTrip/i_read_trip.dart';
import 'package:trip_assistant/features/trip/repositories/updateTrip/i_update_trip.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class UpdateTripPageController {
  final IUpdateTrip updateTripService;
  final IReadTrip readTripService;

  UpdateTripPageController({
    required this.updateTripService,
    required this.readTripService,
  });

  Future<Trip> readTrip({
    required String id,
  }) async {
    var trip = await readTripService
      .readById(
        id: id
      );

    return trip;
  }

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
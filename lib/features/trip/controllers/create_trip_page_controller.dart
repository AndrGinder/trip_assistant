import 'package:trip_assistant/features/trip/repositories/createTrip/i_create_trip.dart';

class CreateTripPageController {
  final ICreateTrip createTripService;

  CreateTripPageController({
    required this.createTripService,
  });

  Future<String> createRecord({
    required String name,
    required String destination,
    required String purpose,
    required String weather
  }) async {
    var tripId = await createTripService
      .createRecord(
        name: name,
        destination: destination,
        purpose: purpose,
        weather: weather
      );

    return tripId;
  }
}
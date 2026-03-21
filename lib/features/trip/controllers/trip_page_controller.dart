import 'package:trip_assistant/features/trip/repositories/readTrip/i_read_trip.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class TripPageController {
  final IReadTrip readTripService;

  TripPageController({
    required this.readTripService,
  });

  Future<Trip> tripPage(
    String id
  ) async {
    var trip = await readTripService
      .readById(id: id);

    return trip;
  }
}
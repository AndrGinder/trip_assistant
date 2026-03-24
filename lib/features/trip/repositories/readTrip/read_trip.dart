import 'package:trip_assistant/features/trip/repositories/readTrip/i_read_trip.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
import 'package:trip_assistant/utils/constants/models.dart';
// import 'package:trip_assistant/utils/constants/trip.dart';

class ReadTrip implements IReadTrip {
  TripService service = TripService();

  @override
  Future<Trip?> readById({
    required String id
  }) async {

    return await service.readById(id: id);

    //local api
    // Trip trip = trips
    //   .firstWhere((trip) => trip.id == id);
      
    // return trip;
  }
}
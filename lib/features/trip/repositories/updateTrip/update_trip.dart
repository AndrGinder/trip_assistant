import 'package:trip_assistant/features/auth/services/auth_service.dart';
import 'package:trip_assistant/features/trip/repositories/updateTrip/i_update_trip.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
import 'package:trip_assistant/utils/constants/models.dart';
// import 'package:trip_assistant/utils/constants/trip.dart';

class UpdateTrip implements IUpdateTrip {
  TripService service = TripService();

  @override
  Future<String> updateRecord({
    required String id,
    required String name,
    required String destination,
    required String purpose,
    required String weather,
  }) async {
    Trip trip = Trip(
      id: id,
      userId: authService.value.currentUser!.uid, 
      name: name, 
      destination: destination, 
      purpose: purpose,
      weather: weather,
    );

    return await service.update(trip: trip);

    // local api
    // final index = trips.indexWhere((trip) => trip.id == id);

    // if (index != -1) {
    //   trips[index]
    //     ..name = name
    //     ..destination = destination
    //     ..purpose = purpose
    //     ..weather = weather;
    // }

    // return id;
  }
}
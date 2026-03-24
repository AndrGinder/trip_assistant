import 'package:trip_assistant/features/auth/services/auth_service.dart';
import 'package:trip_assistant/features/trip/repositories/createTrip/i_create_trip.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
import 'package:trip_assistant/utils/constants/models.dart';
// import 'package:trip_assistant/utils/constants/trip.dart';

class CreateTrip implements ICreateTrip {
  TripService service = TripService();

  @override
  Future<String> createRecord({
    required String name,
    required String destination,
    required String purpose,
    required String weather,
  }) async {
    Trip newTrip = Trip(
      userId: authService.value.currentUser!.uid, 
      name: name, 
      destination: destination, 
      purpose: purpose, 
      weather: weather
    );
    
    return await service.create(trip: newTrip);

    //local api
    
    // trips.add(newTrip);

    // return newTrip.id;
  }
}
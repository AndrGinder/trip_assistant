import 'package:trip_assistant/features/trip/repositories/createTrip/i_create_trip.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class CreateTripService implements ICreateTrip {
  @override
  Future<String> createRecord({
    required String name,
    required String destination,
    required String purpose,
    required String weather,
  }) async {
    Trip newTrip = Trip(
      userId: "user1", 
      name: name, 
      destination: destination, 
      purpose: purpose, 
      weather: weather
    );
    trips.add(newTrip);

    return newTrip.id;
  }
}
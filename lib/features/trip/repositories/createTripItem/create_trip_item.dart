import 'package:trip_assistant/features/trip/repositories/createTripItem/i_create_trip_item.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class CreateTripItem implements ICreateTripItem {
  @override
  Future<String> createRecord({
    required String name,
    required String tripId,
  }) async {
    TripItem newTripItem = TripItem(
      name: name, 
      tripId: tripId,
    );
    
    tripItems.add(newTripItem);

    return newTripItem.id;
  }
}
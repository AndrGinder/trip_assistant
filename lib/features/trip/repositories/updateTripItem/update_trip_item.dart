import 'package:trip_assistant/features/trip/repositories/updateTripItem/i_update_trip_item.dart';
// import 'package:trip_assistant/utils/constants/trip.dart';

class UpdateTrip implements IUpdateTripItem {
  @override
  Future<String> updateRecord({
    required String id,
    required String name,
    required String tripId,
  }) async {
    // final index = tripItems.indexWhere((item) => item.id == id);

    // if (index != -1) {
    //   tripItems[index]
    //     ..name = name
    //     ..tripId = tripId;
    // }

    return id;
  }
}
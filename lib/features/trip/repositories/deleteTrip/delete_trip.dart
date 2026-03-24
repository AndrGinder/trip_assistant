import 'package:trip_assistant/features/trip/repositories/deleteTrip/i_delete_trip.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
// import 'package:trip_assistant/utils/constants/trip.dart';

class DeleteTrip implements IDeleteTrip {
  TripService service = TripService();

  @override
  Future<String> deleteTrip({
    required String id
  }) async {
    return await service.delete(id: id);

    //local api
    // trips.removeWhere((t) => t.id == id);
    
    // return id;
  }
}
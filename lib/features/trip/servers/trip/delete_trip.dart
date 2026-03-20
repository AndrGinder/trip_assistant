import 'package:trip_assistant/features/trip/repositories/trip/i_delete_trip.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class DeleteTrip implements IDeleteTrip {
  @override
  Future<String> deleteTrip({
    required String id
  }) async {
    trips.removeWhere((t) => t.id == id);
    return id;
  }
}
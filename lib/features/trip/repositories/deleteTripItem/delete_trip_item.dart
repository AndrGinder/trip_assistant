import 'package:trip_assistant/features/trip/repositories/deleteTripItem/i_delete_trip_item.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class DeleteTripItem implements IDeleteTripItem {
  @override
  Future<String> deleteRecord({
    required String id
  }) async {
    tripItems.removeWhere((t) => t.id == id);
    
    return id;
  }
}
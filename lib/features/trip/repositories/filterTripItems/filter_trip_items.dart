import 'package:trip_assistant/features/trip/repositories/filterTripItems/i_filter_trip_items.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class FilterTripItems implements IFilterTripItems {
  @override
  Future<List<TripItem>> filterByTripId({
    String tripId = "",
  }) async {
    List<TripItem> items = tripItems
      .where((item) => item.tripId == tripId)
      .toList();
      
    return items;
  }
}
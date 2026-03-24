import 'package:trip_assistant/features/trip/repositories/filterTripItems/i_filter_trip_items.dart';
import 'package:trip_assistant/features/trip/servers/trip_item_service.dart';
import 'package:trip_assistant/utils/constants/models.dart';
// import 'package:trip_assistant/utils/constants/trip.dart';

class FilterTripItems implements IFilterTripItems {
  TripItemService service = TripItemService();

  @override
  Future<List<TripItem>> filterByTripId({
    required tripId,
  }) async {
    return await service.filter(tripId: tripId);

    //local api
    // List<TripItem> items = tripItems
    //   .where((item) => item.tripId == tripId)
    //   .toList();
      
    // return items;
  }
}
import 'package:trip_assistant/features/trip/repositories/deleteTripItem/i_delete_trip_item.dart';
import 'package:trip_assistant/features/trip/repositories/filterTripItems/i_filter_trip_items.dart';
import 'package:trip_assistant/features/trip/repositories/readTrip/i_read_trip.dart';
import 'package:trip_assistant/features/trip/viewModels/read_trip_vm.dart';

class TripPageController {
  final IReadTrip readTripService;
  final IFilterTripItems filterTripItemsService;
  final IDeleteTripItem deleteTripItemService;

  TripPageController({
    required this.readTripService,
    required this.filterTripItemsService,
    required this.deleteTripItemService,
  });

  Future<TripVM> tripPage(
    String id
  ) async {
    var trip = await readTripService
      .readById(
        id: id
      );

    var items = await filterTripItemsService
      .filterByTripId(
        tripId: "1"
      );

    return TripVM(
      id: trip.id, 
      title: trip.name,
      items: items
    );
  }

  Future<String> deleteTripItem(
    String id
  ) async {
    var itemId = await deleteTripItemService
      .deleteRecord(id: id);

    return itemId;
  }
}
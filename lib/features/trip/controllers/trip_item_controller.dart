import 'package:trip_assistant/features/trip/models/trip_item.dart';
import 'package:trip_assistant/features/trip/servers/trip_item_service.dart';
import 'package:trip_assistant/utils/constants/dependencies.dart';

class TripItemController {
  final TripItemService _service;

  TripItemController(this._service);

  Stream<List<TripItem>> watchItems({required String tripId}) {
    return itemService.watchTripItems(tripId);
  }

  Future<void> createItem(TripItem item) async 
    => await _service.addTripItem(
      item.tripId, 
      item
    );

  Future<List<TripItem>> getItems(String tripId) async
    => await _service.getTripItems(tripId);

  Future<void> updateItem(TripItem item) async 
    => await _service.updateTripItem(
      item.tripId, 
      item
    );

  Future<void> deleteItem(
    String tripId, 
    String itemId
  ) async 
    => await _service.deleteTripItem(
      itemId, 
      tripId
    );

  Future<bool> hasItems(String tripId) async {
    final items = await _service.getTripItems(tripId);

    return items.isNotEmpty;
  }
}
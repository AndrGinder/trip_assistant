import 'package:trip_assistant/features/trip/servers/trip_item_service.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class TripItemController {
  final TripItemService _service;

  TripItemController(this._service);

  Future<void> createItem(TripItem item) async {
    await _service.create(item: item);
  }

  Future<List<TripItem>> getItems(String tripId) async {
    return await _service.filter(tripId: tripId);
  }

  Future<bool> hasItems(String tripId) async {
    final items = await _service.filter(tripId: tripId);
    return items.isNotEmpty;
  }

  Future<void> updateItem(TripItem item) async {
    await _service.update(item: item);
  }

  Future<void> deleteItem(String tripId, String itemId) async {
    await _service.delete(
      tripId: tripId, 
      id: itemId,
    );
  }
}
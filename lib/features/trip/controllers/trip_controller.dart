import 'package:trip_assistant/features/trip/models/trip.dart';
import 'package:trip_assistant/features/trip/servers/trip_item_service.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';

class TripController {
  final TripService tripService;
  final TripItemService tripItemService;

  TripController({
    required this.tripService,
    required this.tripItemService,
  });

  Stream<List<Trip>> watchTrips({required String userId}) {
    return tripService.watchTrips(userId: userId);
  }

  Future<List<Trip>> getTrips({required String userId}) async {
    return await tripService.getTrips(userId: userId);
  }

  Future<Trip?> getTrip(String id) async {
    return await tripService.getTrip(id);
  }

  Future<void> addTripWithItems(Trip trip) async {
    final newTrip = await tripService.addTrip(trip);

    final items = await tripItemService.getItemsForTrip(
      id: newTrip.id,
      purpose: newTrip.purpose,
      destination: newTrip.destination,
      weather: newTrip.weather,
    );

    await tripItemService.addItemsToTrip(newTrip.id, items);
  }

  Future<void> updateTrip(Trip trip) async {
    await tripService.updateTrip(trip);
  }

  Future<void> updateTripWithItems(Trip updatedTrip) async {
    final tripId = updatedTrip.id;

    await tripService.updateTrip(updatedTrip);

    final newItems = await tripItemService.getItemsForTrip(
      id: updatedTrip.id,
      purpose: updatedTrip.purpose,
      destination: updatedTrip.destination,
      weather: updatedTrip.weather,
    );

    final currentItems = await tripItemService.getTripItems(tripId);

    final itemsToDelete = currentItems.where(
      (item) => !newItems.any((newItem) => newItem.name == item.name),
    ).toList();

    final existingNames = currentItems.map((e) => e.name).toSet();

    final itemsToAdd = newItems
      .where((item) => !existingNames.contains(item.name))
      .toList();

    await tripItemService.deleteItems(tripId, itemsToDelete);
    await tripItemService.addItemsToTrip(tripId, itemsToAdd);
  }

  Future<void> deleteTripWithItems(Trip trip) async {
    final items = await tripItemService.getTripItems(trip.id);
    await tripItemService.deleteItems(trip.id, items);

    await tripService.deleteTrip(trip.id);
  }
}
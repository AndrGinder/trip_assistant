import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_assistant/features/trip/servers/trip_item_service.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
import 'package:trip_assistant/features/trip/viewModels/read_trip_vm.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class TripController {
  final TripService _tripService;
  final TripItemService? _tripItemService;

  TripController({
    required TripService tripService, 
    TripItemService? tripItemService
  }) : 
    _tripService = tripService, 
    _tripItemService = tripItemService;

  Future<void> createTrip(Trip trip) async {
    await _tripService.create(trip: trip);
  }
  
  Future<void> createTripWithFilteredItems(Trip trip) async {
    await _tripService.create(trip: trip);

    final items = _tripItemService!.selectItems(trip);

    await Future.wait(
      items.map((i) => _tripItemService.create(item: i)),
    );
  }

  Future<List<Trip>> getTrips() async {
    return await _tripService.filter();
  }

  Future<bool> hasTrips() async {
    final trips = await _tripService.filter();
    return trips.isNotEmpty;
  }

  Future<Trip?> getTrip(String id) async {
    return await _tripService.readById(id: id);
  }

  Future<TripVM?> getTripWithItems(String tripId) async {
    final trip = await _tripService.readById(id: tripId);
    if (trip == null) return null;

    final itemsSnapshot = await FirebaseFirestore.instance
        .collection('trips')
        .doc(tripId)
        .collection('items')
        .get();

    final items = itemsSnapshot.docs
        .map((doc) => TripItem.fromJson(doc.id, doc.data()))
        .toList();

    return TripVM(
      id: trip.id,
      title: trip.name,
      items: items,
    );
  }


  Future<bool> tripExists(String id) async {
    final trip = await _tripService.readById(id: id);
    return trip != null;
  }

  Future<void> updateTrip(Trip trip) async {
    await _tripService.update(trip: trip);
  }

  Future<void> updateTripWithItems(Trip trip) async {
    await _tripService.update(trip: trip);

    final currentItems = await _tripItemService!
      .filter( tripId: trip.id );

    final selectedItems = _tripItemService.selectItems(trip);

    final currentNames = currentItems.map((i) => i.name).toSet();
    final selectedNames = selectedItems.map((i) => i.name).toSet();

    final toAdd = selectedItems
        .where((i) => !currentNames.contains(i.name))
        .toList();

    final toDelete = currentItems
        .where((i) => !selectedNames.contains(i.name))
        .toList();

    await Future.wait(
      toAdd.map((i) => _tripItemService.create(item: i))
    );
    await Future.wait(
      toDelete.map((i) => _tripItemService.delete(
        id: i.id, 
        tripId: i.tripId
      ))
    );
  }

  Future<void> deleteTrip(String id) async {
    await _tripService.delete(id: id);
  }
}
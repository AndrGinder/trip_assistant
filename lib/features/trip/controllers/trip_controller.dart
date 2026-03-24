import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
import 'package:trip_assistant/features/trip/viewModels/read_trip_vm.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class TripController {
  final TripService _service;

  TripController(this._service);

  Future<void> createTrip(Trip trip) async {
    await _service.create(trip: trip);
  }

  Future<List<Trip>> getTrips() async {
    return await _service.filter();
  }

  Future<bool> hasTrips() async {
    final trips = await _service.filter();
    return trips.isNotEmpty;
  }

  Future<Trip?> getTrip(String id) async {
    return await _service.readById(id: id);
  }

  Future<TripVM?> getTripWithItems(String tripId) async {
    final trip = await _service.readById(id: tripId);
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
    final trip = await _service.readById(id: id);
    return trip != null;
  }

  Future<void> updateTrip(Trip trip) async {
    await _service.update(trip: trip);
  }

  Future<void> deleteTrip(String id) async {
    await _service.delete(id: id);
  }
}
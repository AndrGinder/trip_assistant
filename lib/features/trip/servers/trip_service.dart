import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_assistant/features/trip/models/trip_item.dart';
import '../models/trip.dart';

class TripService {
  final _trips = FirebaseFirestore.instance.collection('trips');

  Stream<List<Trip>> watchTrips({required String userId}) {
    return _trips
        .where('userId', isEqualTo: userId)
        .orderBy('name')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Trip.fromFirestore(doc)).toList());
  }

  Future<List<Trip>> getTrips({required String userId}) async {
    final snapshot =
        await _trips.where('userId', isEqualTo: userId).orderBy('name').get();
    return snapshot.docs.map((doc) => Trip.fromFirestore(doc)).toList();
  }

  Future<Trip?> getTrip(String id) async {
    final doc = await _trips.doc(id).get();
    if (!doc.exists) return null;
    return Trip.fromFirestore(doc);
  }

  Future<Trip> addTrip(Trip trip) async {
    final docRef = await _trips.add(trip.toMap());
    return trip.copyWith(id: docRef.id);
  }

  Future<void> addItemsToTrip(
    String tripId,
    List<TripItem> items,
  ) async {
    final collection = FirebaseFirestore.instance
        .collection('trips')
        .doc(tripId)
        .collection('items');

    final batch = FirebaseFirestore.instance.batch();

    for (final item in items) {
      final doc = collection.doc();

      final itemToSave = item.copyWith(
        id: doc.id,
        tripId: tripId,
      );

      batch.set(doc, itemToSave.toMap());
    }

    await batch.commit();
  }

  Future<void> updateTrip(Trip trip) async {
    await _trips.doc(trip.id).update(trip.toMap());
  }

  Future<void> deleteTrip(String id) async {
    final itemsSnapshot = await _trips.doc(id).collection('items').get();
    for (var doc in itemsSnapshot.docs) {
      await doc.reference.delete();
    }

    await _trips.doc(id).delete();
  }
}
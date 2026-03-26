import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trip_assistant/utils/constants/trip.dart';
import '../models/trip_item.dart';

class TripItemService {
  final _trips = FirebaseFirestore.instance.collection('trips');

  Stream<List<TripItem>> watchTripItems(String tripId) {
  return _trips
      .doc(tripId)
      .collection('items')
      .orderBy('name')
      .snapshots()
      .map((snapshot) {
        debugPrint("Items count: ${snapshot.docs.length}");

        return snapshot.docs
            .map((doc) => TripItem.fromMap(doc.data(), doc.id, tripId))
            .toList();
      });
}

  Future<List<TripItem>> getItemsForTrip({
    required String id,
    required String purpose,
    required String destination,
    required String weather,
  }) async {
    final filteredItems = allItems.where((template) {
      final matchesPurpose = template.purposes.isEmpty || purposeConditions.contains(purpose);
      final matchesDestination = template.destinations.isEmpty || destinationConditions.contains(destination);
      final matchesWeather = template.weathers.isEmpty || weatherConditions.contains(weather);

      return matchesPurpose && matchesDestination && matchesWeather;
    }).toList();

    return filteredItems.map((item) {
      return TripItem(
        id: '',
        name: item.name,
        tripId: id,
      );
    }).toList();
  }

  Future<List<TripItem>> getTripItems(String tripId) async {
    final snapshot = await _trips
      .doc(tripId)
      .collection('items')
      .get();

    final list = snapshot.docs.map((doc) => TripItem.fromMap(doc.data(), tripId, doc.id)).toList();
    debugPrint("Item: ${list[0].tripId}");
    return snapshot.docs.map((doc) => TripItem.fromMap(doc.data(), tripId, doc.id)).toList();
  }

  Future<TripItem> addTripItem(String tripId, TripItem item) async {
    final docRef =
        await _trips.doc(tripId).collection('items').add(item.toMap());
    return item.copyWith(id: docRef.id);
  }
  
  Future<void> addItemsToTrip(
    String tripId,
    List<TripItem> items,
  ) async {
    final collection = _trips
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

  Future<void> updateTripItem(String tripId, TripItem item) async {
    await _trips.doc(tripId).collection('items').doc(item.id).update(item.toMap());
  }

  Future<void> deleteTripItem(String itemId, String tripId) async {
    await _trips.doc(tripId).collection('items').doc(itemId).delete();
  }

  Future<void> deleteItems(
    String tripId,
    List<TripItem> items,
  ) async {
    final batch = FirebaseFirestore.instance.batch();

    final collection = _trips
        .doc(tripId)
        .collection('items');

    for (final item in items) {
      batch.delete(collection.doc(item.id));
    }

    await batch.commit();
  }
}
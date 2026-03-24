import 'package:trip_assistant/features/auth/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class TripService {

  final _db = FirebaseFirestore.instance;
  final _collection = 'trips';

  Future<String> create({
    required Trip trip
  }) async {
    await _db.collection(_collection)
      .doc(trip.id)
      .set(trip.toJson());

    trips.add(trip);

    return trip.id;
  }
  
  Future<List<Trip>> filter() async {
    final snapshot = await _db
        .collection(_collection)
        .where((record) =>
          'userId', 
          isEqualTo: authService.value.currentUser!.uid
        )
        .get();

    return snapshot.docs
        .map((doc) => Trip.fromJson(doc.id, doc.data()))
        .toList();
  }
  
  Future<Trip?> readById({
    required String id,
  }) async {
    final doc = await _db.collection(_collection).doc(id).get();

    if (!doc.exists) {
      return null;
    }

    return Trip.fromJson(doc.id, doc.data()!);
  }

  Future<String> update({
    required Trip trip
  }) async {
    await _db.collection(_collection).doc(trip.id).update(trip.toJson());

    return trip.id;
  }

  Future<String> delete({
    required String id
  }) async {
    final items = await _db.collection('trips')
      .doc(id)
      .collection('items')
      .get();

    for (final doc in items.docs) {
      await doc.reference.delete();
    }

    await _db.collection('trips')
      .doc(id)
      .delete();

    return id;
  }
}
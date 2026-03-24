import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class TripItemService {
  final _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _itemsRef(String tripId) {
    return _db.collection('trips').doc(tripId).collection('items');
  }
  
  Future<String> create({
    required TripItem item
  }) async {
    await _itemsRef(item.tripId).doc(item.id).set(item.toJson());

    return item.id;
  }

  Future<List<TripItem>> filter({
    required String tripId,
  }) async {
    final snapshot = await _itemsRef(tripId).get();

    return snapshot.docs
        .map((doc) => TripItem.fromJson(doc.id, doc.data()))
        .toList();
  }

  Future<String> update({
    required TripItem item,
  }) async {    
    await _itemsRef(item.tripId)
      .doc(item.id)
      .update(item.toJson());

    return item.id;
  }

  Future<String> delete({
    required String id,
    required String tripId,
  }) async {
    await _itemsRef(tripId).doc(id).delete();

    return id;
  }
}
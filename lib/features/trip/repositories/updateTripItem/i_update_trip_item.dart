abstract class IUpdateTripItem {
  Future<String> updateRecord({
    required String id,
    required String name,
    required String tripId,
  });
}
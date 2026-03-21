abstract class ICreateTripItem {
  Future<String> createRecord({
    // required String userId,
    required String name,
    required String tripId,
  });
}
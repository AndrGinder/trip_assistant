abstract class IAddTripItem {
  Future<String> addTripItem({
    required String tripId,
    required String name,
  });
}
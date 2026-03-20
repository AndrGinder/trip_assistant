abstract class IEditTrip {
  Future<String> editTrip({
    required String id,
    required String description,
  });
}
abstract class IAddTrip {
  Future<String> addTrip({
    // required String userId,
    required String name,
    required String destination,
    required String purpose,
    required String weather,
  });
}
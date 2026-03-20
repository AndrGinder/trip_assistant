abstract class IUpdateTrip {
  Future<String> updateTrip({
    required String id,
    required String name,
    required String destination,
    required String purpose,
    required String weather,
  });
}
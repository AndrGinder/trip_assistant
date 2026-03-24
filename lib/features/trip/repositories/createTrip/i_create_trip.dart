abstract class ICreateTrip {
  Future<String> createRecord({
    required String name,
    required String destination,
    required String purpose,
    required String weather,
  });
}
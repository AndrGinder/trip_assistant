abstract class IAddTripCondition {
  Future<String> addTripCondition({
    required String tripId,
    required String destination,
    required String purpose,
    required String weather,
  });
}
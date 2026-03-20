abstract class IEditTripCondition {
  Future<String> editTripCondition({
    required String id,
    required String destination,
    required String purpose,
    required String weather,
  });
}
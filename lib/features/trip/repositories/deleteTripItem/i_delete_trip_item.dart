abstract class IDeleteTripItem {
  Future<String> deleteRecord({
    required String id,
  });
}
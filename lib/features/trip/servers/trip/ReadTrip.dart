import 'package:trip_assistant/features/trip/repositories/trip/IReadTrip.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class ReadTrip implements IReadTrip {
  @override
  Future<TripCondition> readTrip({
    required String id
  }) async {
    // Implementation for reading a trip
    throw UnimplementedError();
  }
}
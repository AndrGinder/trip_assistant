import 'package:trip_assistant/features/trip/repositories/tripCondition/i_read_trip_condition.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class ReadTripCondition implements IReadTripCondition {
  @override
  Future<TripCondition> readTripCondition({
    required String id
  }) async {
    // Implementation for reading a trip condition
    throw UnimplementedError();
  }
}
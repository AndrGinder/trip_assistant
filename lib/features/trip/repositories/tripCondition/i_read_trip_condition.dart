import 'package:trip_assistant/utils/constants/models.dart';

abstract class IReadTripCondition {
  Future<TripCondition> readTripCondition({
    required String id,
  });
}
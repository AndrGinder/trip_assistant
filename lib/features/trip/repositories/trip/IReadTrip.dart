import 'package:trip_assistant/utils/constants/models.dart';

abstract class IReadTrip {
  Future<TripCondition> readTrip({
    required String id,
  });
}
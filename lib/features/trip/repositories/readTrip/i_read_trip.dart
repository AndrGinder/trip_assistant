import 'package:trip_assistant/utils/constants/models.dart';

abstract class IReadTrip {
  Future<Trip> readTrip({
    required String id,
  });
}
import 'package:trip_assistant/utils/constants/models.dart';

abstract class IReadTrip {
  Future<Trip?> readById({
    required String id,
  });
}
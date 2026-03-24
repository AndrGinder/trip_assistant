import 'package:trip_assistant/utils/constants/models.dart';

abstract class IFilterTripItems {
  Future<List<TripItem>> filterByTripId({
    required String tripId,
  });
}
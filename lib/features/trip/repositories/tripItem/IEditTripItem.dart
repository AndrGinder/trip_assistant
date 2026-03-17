import 'package:trip_assistant/utils/constants/trip.dart';

abstract class IEditTripCondition {
  Future<String> editTripCondition({
    required String id,
    required String name,
    // required Image image,
    required String tripId,
    required TripItemState state
  });
}
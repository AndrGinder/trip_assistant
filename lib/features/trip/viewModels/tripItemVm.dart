import 'package:trip_assistant/utils/constants/trip.dart';

class TripItemVm {
  String id;
  String title;
  TripItemState state;

  TripItemVm({
    required this.id,
    required this.title,
    required this.state,
  });
}
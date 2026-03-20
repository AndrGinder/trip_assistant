import 'package:trip_assistant/utils/constants/trip.dart';

class TripItemVM {
  String id;
  String title;
  TripItemState state;

  TripItemVM({
    required this.id,
    required this.title,
    required this.state,
  });
}
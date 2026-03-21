import 'package:trip_assistant/utils/constants/models.dart';

class TripVM {
  String id = "";
  String title = "";
  List<TripItem> items = [];

  TripVM({
    required this.id,
    required this.title,
    required this.items
  });
}
import 'package:trip_assistant/utils/constants/models.dart';

abstract class IFilterTrips {
  Future<List<Trip>> filterByUserId();
}
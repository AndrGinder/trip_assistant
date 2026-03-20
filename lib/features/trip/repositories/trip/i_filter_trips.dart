import 'package:trip_assistant/utils/constants/models.dart';

abstract class IFilterTrips {
  // Future<List<Trip>> filterTrips({
  //   required String userId,
  // });
  Future<List<Trip>> filterTrips();
}
import 'package:trip_assistant/utils/constants/trip.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Trip {
  final String id;
  final String userId;
  final String name;
  final String destination;
  final String purpose;
  final String weather;

  Trip({
    String? id,
    required this.userId,
    required this.name,
    required this.destination,
    required this.purpose,
    required this.weather,
  }) : id = id ?? uuid.v4();

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'name': name,
    'destination': destination,
    'purpose': purpose,
    'weather': weather,
  };

  factory Trip.fromJson(String id, Map<String, dynamic> json) {
    return Trip(
      id: id,
      userId: json['userEmail'] ?? '',
      name: json['name'] ?? '',
      destination: json['destination'] ?? '',
      purpose: json['purpose'] ?? '',
      weather: json['weather'] ?? '',
    );
  }
}

class TripItem {
  final String id;
  final String name;
  final String tripId;
  final TripItemState state;

  TripItem({
    String? id,
    required this.name,
    required this.tripId,
    this.state = TripItemState.unchecked,
  }) : id = id ?? uuid.v4();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'tripId': tripId,
  };

  factory TripItem.fromJson(String id, Map<String, dynamic> json) {
    return TripItem(
      id: id,
      name: json['name'] ?? '',
      tripId: json['destination'] ?? '',
    );
  }

  TripItem copyWith({
    String? name,
    String? tripId,
    TripItemState? state,
  }) {
    return TripItem(
      id: id,
      name: name ?? this.name,
      tripId: tripId ?? this.tripId,
      state: state ?? this.state,
    );
  }
}
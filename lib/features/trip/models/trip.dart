import 'package:cloud_firestore/cloud_firestore.dart';

class Trip {
  final String id;
  final String userId;
  final String name;
  final String destination;
  final String purpose;
  final String weather;

  Trip({
    required this.id,
    required this.userId,
    required this.name,
    required this.destination,
    required this.purpose,
    required this.weather,
  });

  factory Trip.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Trip(
      id: doc.id,
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      destination: data['destination'] ?? '',
      purpose: data['purpose'] ?? '',
      weather: data['weather'] ?? '',
    );
  }

  /// Convert Trip to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'destination': destination,
      'purpose': purpose,
      'weather': weather,
    };
  }

  /// Copy Trip with optional changes
  Trip copyWith({
    String? id,
    String? userId,
    String? name,
    String? destination,
    String? purpose,
    String? weather,
  }) {
    return Trip(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      destination: destination ?? this.destination,
      purpose: purpose ?? this.purpose,
      weather: weather ?? this.weather,
    );
  }
}
class TripItem {
  final String id;
  final String tripId;
  final String name;

  TripItem({
    required this.id,
    required this.tripId,
    required this.name,
  });

  factory TripItem.fromMap(Map<String, dynamic> map, String id, String tripId) {
    return TripItem(
      id: id,
      tripId: tripId,
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  TripItem copyWith({
    String? id,
    String? tripId,
    String? name,
  }) {
    return TripItem(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      name: name ?? this.name,
    );
  }
}
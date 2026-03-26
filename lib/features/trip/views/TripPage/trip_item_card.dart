import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';

class TripItemCard extends StatelessWidget {
  final String id;
  final String title;

  final bool isDragging;
  final bool isFeedback;

  const TripItemCard({
    super.key,
    required this.id,
    required this.title,
    this.isDragging = false,
    this.isFeedback = false,
  });

  @override
  Widget build(BuildContext context) {
    final tile = ListTile(
      tileColor: isDragging
        ? Colors.blueGrey.shade100
        : null,
      title: Text(title),
    );

    return Opacity(
      opacity: isDragging 
        ? BlockProperties.zeroOpacity 
        : 1,
      child: tile,
    );
  }
}
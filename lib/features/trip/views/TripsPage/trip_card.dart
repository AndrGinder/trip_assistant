import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripCard extends StatelessWidget {
  final String id;
  final String name;

  final bool isDragging;
  final bool isFeedback;
  final VoidCallback? onTap;

  const TripCard({
    super.key,
    required this.id,
    required this.name,
    this.isDragging = false,
    this.isFeedback = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      elevation: isFeedback 
        ? 12 
        : 2,
      child: Opacity(
        opacity: isDragging ? BlockProperties.zeroOpacity : 1,
        child: ListTile(
          tileColor: isDragging
            ? Colors.blueGrey.shade100
            : null,
          title: Text(name),
          onTap: isDragging
            ? null
            : onTap ??
              () => NavigationUtils.navigateToTripPage(
                context,
                id: id,
                title: name,
              ),
        ),
      ),
    );

    if (isFeedback) {
      return Transform.scale(
        scale: 1.05,
        child: card,
      );
    }

    return card;
  }
}
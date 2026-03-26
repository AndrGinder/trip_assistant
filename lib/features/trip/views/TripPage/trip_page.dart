import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/features/trip/controllers/trip_item_controller.dart';
import 'package:trip_assistant/features/trip/models/trip_item.dart';
import 'package:trip_assistant/features/trip/views/TripPage/trip_item_card.dart';
import 'package:trip_assistant/utils/constants/dependencies.dart';

class TripPage extends StatefulWidget {
  final String id;
  final String title;

  final TripItemController itemController =
      TripItemController(itemService);

  TripPage({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  bool _isDragging = false;

  Future<void> _deleteItem(TripItem item) async {
    await itemService.deleteTripItem(item.id, widget.id);

    setState(() {
      _isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          StreamBuilder<List<TripItem>>(
            stream: widget.itemController.watchItems(tripId: widget.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final items = snapshot.data!;

              if (items.isEmpty) {
                return const Center(
                  child: Text('No items'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return LongPressDraggable<TripItem>(
                    data: item,
                    dragAnchorStrategy: pointerDragAnchorStrategy,

                    onDragStarted: () {
                      HapticFeedback.lightImpact();
                      setState(() => _isDragging = true);
                    },

                    onDraggableCanceled: (_, _) {
                      setState(() => _isDragging = false);
                    },

                    onDragEnd: (_) {
                      setState(() => _isDragging = false);
                    },

                    feedback: Material(
                      elevation: 12,
                      color: Colors.transparent,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TripItemCard(
                          key: ValueKey("feedback_${item.id}"),
                          id: item.id,
                          title: item.name,
                          isFeedback: true,
                        ),
                      ),
                    ),

                    childWhenDragging: TripItemCard(
                      key: ValueKey("drag_${item.id}"),
                      id: item.id,
                      title: item.name,
                      isDragging: true,
                    ),

                    child: TripItemCard(
                      key: ValueKey(item.id),
                      id: item.id,
                      title: item.name,
                    ),
                  );
                },
              );
            },
          ),

          if (_isDragging)
            Align(
              alignment: Alignment.bottomCenter,
              child: DragTarget<TripItem>(
                onAcceptWithDetails: (details) {
                  _deleteItem(details.data);
                },
                builder: (context, candidateData, rejectedData) {
                  final isActive = candidateData.isNotEmpty;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isActive
                          ? Colors.redAccent
                          : Colors.blueGrey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Icon(
                        isActive
                            ? Icons.delete_forever
                            : Icons.delete_outline,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationUtils.navigateToEditTripPage(
            context,
            id: widget.id,
            title: widget.title,
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/logout.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/features/trip/controllers/trip_controller.dart';
import 'package:trip_assistant/features/trip/controllers/trip_item_controller.dart';
import 'package:trip_assistant/features/trip/servers/trip_item_service.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
import 'package:trip_assistant/features/trip/viewModels/read_trip_vm.dart';
import 'package:trip_assistant/features/trip/views/TripPage/trip_item_card.dart';
import 'package:trip_assistant/utils/constants/models.dart';

class TripPage extends StatefulWidget {
  final String id;
  final String title;

  final TripController tripController = TripController(
    tripService: TripService(), 
    tripItemService: TripItemService()
  );
  final TripItemController itemController =
      TripItemController(TripItemService());

  TripPage({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  TripVM? _model;
  bool _isLoading = true;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _loadTrip();
  }

  Future<void> _loadTrip() async {
    try {
      final data = await widget.tripController
        .getTripWithItems(widget.id);

      setState(() {
        _model = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load trip')),
      );
    }
  }

  Future<void> _deleteItem(TripItem item) async {
    try {
      await widget.itemController
        .deleteItem(widget.id, item.id);

      // safer: reload from backend
      await _loadTrip();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Delete failed')),
      );
    } finally {
      setState(() => _isDragging = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_model?.title ?? widget.title),
        actions: const [ LogoutButton() ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _model == null
              ? const Center(child: Text('Trip not found'))
              : Stack(
                  children: [
                    ListView.builder(
                      padding:
                          EdgeInsets.all(BlockProperties.thinPadding),
                      itemCount: _model!.items.length,
                      itemBuilder: (context, index) {
                        final item = _model!.items[index];

                        return LongPressDraggable<TripItem>(
                          data: item,
                          dragAnchorStrategy: pointerDragAnchorStrategy,

                          onDragStarted: () {
                            HapticFeedback.lightImpact();
                            setState(() => _isDragging = true);
                          },
                          onDragEnd: (_) {
                            setState(() => _isDragging = false);
                          },

                          feedback: Material(
                            elevation: 12,
                            color: Colors.transparent,
                            child: Transform.scale(
                              scale: BlockProperties.scale,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: TripItemCard(
                                  id: item.id,
                                  title: item.name,
                                  isFeedback: true,
                                ),
                              ),
                            ),
                          ),

                          childWhenDragging: TripItemCard(
                            id: item.id,
                            title: item.name,
                            isDragging: true,
                          ),

                          child: TripItemCard(
                            id: item.id,
                            title: item.name,
                          ),
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
                              duration:
                                  const Duration(milliseconds: 200),
                              height: 80,
                              width: 80,
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? Colors.redAccent
                                    : Colors.blueGrey,
                                borderRadius:
                                    BorderRadius.circular(16),
                              ),
                              child: Icon(
                                isActive
                                    ? Icons.delete_forever
                                    : Icons.delete_outline,
                                color: Colors.white,
                                size: 32,
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/logout.dart';
import 'package:trip_assistant/features/trip/controllers/trip_page_controller.dart';
import 'package:trip_assistant/features/trip/repositories/deleteTripItem/delete_trip_item.dart';
import 'package:trip_assistant/features/trip/repositories/filterTripItems/filter_trip_items.dart';
import 'package:trip_assistant/features/trip/repositories/readTrip/read_trip.dart';
import 'package:trip_assistant/features/trip/viewModels/read_trip_vm.dart';
import 'package:trip_assistant/features/trip/views/TripPage/trip_item_card.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripPage extends StatefulWidget {
  final String id;
  final String title;

  final TripPageController controller = TripPageController(
    readTripService: ReadTrip(),
    filterTripItemsService: FilterTripItems(),
    deleteTripItemService: DeleteTripItem(),
  );

  TripPage({
    super.key,
    required this.id, 
    required this.title
  });

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {

  late TripVM _model;
  bool _isLoading = true;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _loadTrip();
  }

  Future<void> _loadTrip() async {
    final data = await widget.controller
      .tripPage(widget.id);

    setState(() {
      _model = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_model.title),
        actions: [ LogoutButton() ],
      ),
      body: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.all(BlockProperties.thinPadding),
                itemCount: _model.items.length,
                  itemBuilder: (context, index) {
                    final item = _model.items[index];

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
                        child: Transform.scale(
                          scale: BlockProperties.scale,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
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
                      onAcceptWithDetails: (details) async {
                        final item = details.data;

                        await widget.controller.deleteTripItem(item.id);

                        setState(() {
                          _isDragging = false;
                          _model.items.removeWhere((t) => t.id == item.id);
                        });
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
        onPressed: (){
          NavigationUtils.navigateToEditTripPage(
            context, 
            id: widget.id, 
            title: widget.title,
          );
        },
        tooltip: widget.title,
        child: Icon(Icons.edit),
      ),
    );
  }
}
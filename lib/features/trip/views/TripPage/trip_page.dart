import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/controllers/trip_page_controller.dart';
import 'package:trip_assistant/features/trip/repositories/filterTripItems/filter_trip_items.dart';
import 'package:trip_assistant/features/trip/repositories/readTrip/read_trip.dart';
import 'package:trip_assistant/features/trip/viewModels/read_trip_vm.dart';
import 'package:trip_assistant/utils/constants/trip.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripPage extends StatefulWidget {
  final String id;
  final String title;

  final TripPageController controller = TripPageController(
    readTripService: ReadTrip(),
    filterTripItemsService: FilterTripItems(),
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
      ),
      body: ListView.builder(
        itemCount: _model.items.length,
        itemBuilder: (context, index) {
          final item = _model.items[index];
          
          return _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListTile(
              title: Text(item.name),
              trailing: switch(item.state) {
                TripItemState.checked => Icon(Icons.check),
                TripItemState.unchecked => Icon(Icons.check_box_outline_blank),
                TripItemState.excluded => Icon(Icons.block),
              },
              onTap: () => NavigationUtils.navigateToSubmitTripItemPage(
                context,
                id: item.id, 
                name: item.name, 
                tripId: item.tripId
              ),
            );
        },
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
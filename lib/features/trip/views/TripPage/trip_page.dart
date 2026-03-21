import 'package:flutter/material.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripPage extends StatefulWidget {
  final String id;
  final String title;

  const TripPage({
    super.key,
    required this.id, 
    required this.title
  });

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  List<TripItem> items = tripItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          
          return ListTile(
            title: Text(item.title),
            trailing: switch(item.state) {
              TripItemState.checked => Icon(Icons.check),
              TripItemState.unchecked => Icon(Icons.check_box_outline_blank),
              TripItemState.excluded => Icon(Icons.block),
            },
            onTap: () => NavigationUtils.navigateToSubmitTripItemPage(
              context,
              id: item.id, 
              name: item.title, 
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
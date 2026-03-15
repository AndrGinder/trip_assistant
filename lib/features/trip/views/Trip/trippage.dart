import 'package:flutter/material.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class TripPage extends StatefulWidget {
  const TripPage({
    super.key,
    required this.id, 
    required this.conditionsId, 
    required this.title
  });

  final String id;
  final String conditionsId;
  final String title;

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {

  // Trip trip = myTrips
  //   .firstWhere((trip) => trip.id == widget.id);

  List<TripItem> items = <TripItem>[
    TripItem(title: "Towel", tripId: "1"),
    TripItem(title: "Toothbrush", tripId: "1"),
    TripItem(title: "Shampoo", tripId: "1"),
    TripItem(title: "Shaving kit", tripId: "1"),
    TripItem(title: "Clothes", tripId: "1"),
    TripItem(title: "Shoes", tripId: "1"),
  ];

  // void _getTripItems(){
  //   setState(() {
  //     item.setState(TripThingState.checked);
  //   });
  // }

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
              TripThingState.checked => Icon(Icons.check),
              TripThingState.unchecked => Icon(Icons.check_box_outline_blank),
              TripThingState.excluded => Icon(Icons.block),
            },
            onTap: ()=> NavigationUtils.navigateToSubmitTripItemPage(
              context,
              id: item.id, 
              title: item.title, 
              tripId: item.tripId
            ),
          );
        },
      ),
      
      // else if some of items check they get checked (became less attractive and moves to end of list)

      //show preffered checked/unchecked items list
      //for every item show check/recheck evaluated button
      //if item is checked then show uncheck button

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NavigationUtils.navigateToEditTripPage(
            context, 
            id: widget.id, 
            title: widget.title, 
            tripConditionsId: widget.conditionsId
          );
        },
        tooltip: widget.title,
        child: Icon(Icons.edit),
      ),
    );
  }
}
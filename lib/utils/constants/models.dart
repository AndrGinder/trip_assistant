import 'package:trip_assistant/utils/constants/constants.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Trip{
  String? id;
  String title;

  Trip({
    required this.title
  })
  {
    id = id ?? uuid.v4(); 
  }
}

class TripCondition{
  String? id;
  String title;
  TripConditionType type;
  int tripId;

  TripCondition({
    required this.title, 
    required this.type, 
    required this.tripId
  })
  {
    id = id ?? uuid.v4(); 
  }
}

class TripItem{
  String id = uuid.v4();
  String title;
  // Image? screen;
  int tripId;
  TripThingState state = TripThingState.unchecked;

  TripItem({
    required this.title, 
    required this.tripId,
  });

  void setScreen(
   // {Image? value}
  )
  {
    // if(image != null){
    //   screen = value;
    // }
  }

  void setState(TripThingState value){
    state = value;

    // switch(action){
    //   case "Check":
    //     state = TripThingState.checked;
    //     break;
    //   case "Exclude":
    //     state = TripThingState.excluded;
    //     break;
    //   default:
    //     state = TripThingState.unchecked;
    // }
  }
}
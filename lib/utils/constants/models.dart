import 'package:trip_assistant/utils/constants/trip.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class User{
  String id = uuid.v4();
  String name;
  String email;
  String passwordHash;

  User({
    required this.name,
    required this.email,
    required this.passwordHash
  });
}

class Trip{
  String id = uuid.v4();
  String userId;
  String name;
  String destination;
  String purpose;
  String weather;

  Trip({
    required this.userId,
    required this.name,
    required this.destination,
    required this.purpose,
    required this.weather,
  });
}

class TripItem{
  String id = uuid.v4();
  String title;
  // Image? screen;
  String tripId;
  TripItemState state = TripItemState.unchecked;

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

  void setState(TripItemState value){
    state = value;

    // switch(action){
    //   case "Check":
    //     state = TripItemState.checked;
    //     break;
    //   case "Exclude":
    //     state = TripItemState.excluded;
    //     break;
    //   default:
    //     state = TripItemState.unchecked;
    // }
  }
}
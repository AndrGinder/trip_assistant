import 'package:trip_assistant/utils/constants/models.dart';

var trips = <Trip>[
  // Trip(userId: "user1", name: "Budapest B2B Conference", destination: '', purpose: '', weather: ''),
  // Trip(userId: "user1", name: "Date with Angela at Marconi`s", destination: '', purpose: '', weather: ''),
  // Trip(userId: "user1", name: "Buy new shoes", destination: '', purpose: '', weather: ''),
  // Trip(userId: "user1", name: "Buy products", destination: '', purpose: '', weather: ''),
  // Trip(userId: "user1", name: "Date with Angela at Marconi`s", destination: '', purpose: '', weather: ''),
  // Trip(userId: "user1", name: "Wash car", destination: '', purpose: '', weather: ''),
  // Trip(userId: "user1", name: "Daily meeting", destination: '', purpose: '', weather: ''),
];

List<TripItem> tripItems = <TripItem>[
  TripItem(name: "Towel", tripId: "1"),
  TripItem(name: "Toothbrush", tripId: "1"),
  TripItem(name: "Shampoo", tripId: "1"),
  TripItem(name: "Shaving kit", tripId: "1"),
  TripItem(name: "Clothes", tripId: "1"),
  TripItem(name: "Shoes", tripId: "1"),
];

var destinationConditions = ['Beach', 'Mountain', 'City', 'Countryside'];
var purposeConditions = ['Leisure', 'Business', 'Education', 'Other'];
var weatherConditions = ['Sunny', 'Rainy', 'Cloudy', 'Snowy'];

enum Location{
  city,
  urban,
  cityUrban,
  sea,
  beach,
  seaBeach,
  mountains,
  camp,
  mountainsCamp,
  otherCountry
}

enum Purpose{
  tourism,
  workTrip,
  activeRelax,
  relax,
  spa,
}

enum Weather{
  hot,
  cold,
  rain,
  coldRain,
  relax,
  spa,
}

// enum TripConditionType{
//   destination,
//   weather,
//   purpose,
// }

enum TripItemState{
  unchecked,
  checked,
  excluded,
}

// enum TripItemType{
//   passport,
//   tickets,
//   booking,
//   insurance,
//   driversDocs,
//   creditCards,
//   cash,
//   phone,
//   chargingDevices,
//   powerBank,
//   earphones,
//   gadgets,
//   toothHygiene,
//   bodyCare,
//   faceCare,
//   cleaningThings,
//   basicFirstAidKit,
//   stomachMedicine,
//   allergicMedicine,
//   individualMedicine,
//   basicClothes,
//   warmClothes,
//   summerClothes,
//   formalClothes,
//   footwear,
//   sunProtect,
//   coldProtect,
//   rainProtect,
//   camping,
//   beach,
//   sport,
//   additional,
// }

// enum TripItemTitle{
//   "Passport of Citizen",
//   "Passport of Foreigner",
//   "Biometric Passport",
//   "ID Card",
//   "Airline Ticket(s)",
//   "Train Ticket(s)",
//   "Bus Ticket(s)",
//   "Boarding Pass(es)",
//   "Hotel Submission",
//   "Airbnb Booking",
//   "Hostel Booking",
//   "Touristical Insurance",
//   "Medical Insurance",
//   "Medical Insurance",
//   "Driver's license",
//   "Credit Card",
//   "Cash",
//   "Phone",
//   "Charging device",
//   "Power Bank",
//   "Headphones",
//   "Earphones",
//   "Buds",
//   "Toothbrush",
//   "Toothpaste",
//   "Liquid Soap",
//   "Soap Bricket",
//   "Liquid Soap",
// }
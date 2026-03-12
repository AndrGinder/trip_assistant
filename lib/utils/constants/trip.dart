import 'package:trip_assistant/utils/constants/models.dart';

var myTrips = <Trip>[
  Trip(title: "Budapest B2B Conference"),
  Trip(title: "Date with Angela at Marconi`s"),
  Trip(title: "Buy new shoes"),
  Trip(title: "Buy products"),
  Trip(title: "Date with Angela at Marconi`s"),
  Trip(title: "Wash car"),
  Trip(title: "Daily meeting"),
];

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

enum TripConditionType{
  destination,
  weather,
  purpose,
}

enum TripThingState{
  unchecked,
  checked,
  excluded,
}

enum TripItemType{
  passport,
  tickets,
  booking,
  insurance,
  driversDocs,
  creditCards,
  cash,
  phone,
  chargingDevices,
  powerBank,
  earphones,
  gadgets,
  toothHygiene,
  bodyCare,
  faceCare,
  cleaningThings,
  basicFirstAidKit,
  stomachMedicine,
  allergicMedicine,
  individualMedicine,
  basicClothes,
  warmClothes,
  summerClothes,
  formalClothes,
  footwear,
  sunProtect,
  coldProtect,
  rainProtect,
  camping,
  beach,
  sport,
  additional,
}

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
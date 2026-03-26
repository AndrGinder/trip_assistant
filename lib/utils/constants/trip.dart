import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

FirebaseFirestore db = FirebaseFirestore.instance;

final String tripCollection = 'trips';
final String itemCollection = 'items';

final String userIdProp = 'userId';

class TripItemTemplate {
  final String name;
  final List<String> destinations;
  final List<String> purposes;
  final List<String> weathers;

  TripItemTemplate({
    required this.name,
    this.destinations = const [],
    this.purposes = const [],
    this.weathers = const [],
  });
}

enum TripItemState{
  unchecked,
  checked,
  excluded,
}

final List<TripItemTemplate> allItems = [

  TripItemTemplate(name: 'Passport'),
  TripItemTemplate(name: 'ID card'),
  TripItemTemplate(name: 'Tickets'),
  TripItemTemplate(name: 'Phone charger'),
  TripItemTemplate(name: 'Power bank'),
  TripItemTemplate(name: 'Backpack'),
  TripItemTemplate(name: 'Water bottle'),
  TripItemTemplate(name: 'Underwear'),
  TripItemTemplate(name: 'Socks'),
  TripItemTemplate(name: 'Toothbrush'),
  TripItemTemplate(name: 'Toothpaste'),
  TripItemTemplate(name: 'Deodorant'),
  TripItemTemplate(name: 'Medications'),
  TripItemTemplate(name: 'Hand sanitizer'),
  TripItemTemplate(name: 'Snacks'),

  TripItemTemplate(
    name: 'Laptop',
    purposes: ['business', 'education'],
  ),
  TripItemTemplate(
    name: 'Headphones',
    purposes: ['leisure', 'business'],
  ),
  TripItemTemplate(
    name: 'Camera',
    purposes: ['leisure'],
  ),
  TripItemTemplate(
    name: 'Universal adapter',
  ),

  TripItemTemplate(name: 'T-shirts'),
  TripItemTemplate(name: 'Pants'),
  TripItemTemplate(name: 'Sleepwear'),
  TripItemTemplate(name: 'Comfortable shoes'),

  TripItemTemplate(name: 'Shampoo'),
  TripItemTemplate(name: 'Towel'),
  TripItemTemplate(name: 'Wet wipes'),

  TripItemTemplate(name: 'First aid kit'),
  TripItemTemplate(name: 'Pain relievers'),
  TripItemTemplate(name: 'Allergy medicine'),

  TripItemTemplate(
    name: 'Swimwear',
    destinations: ['beach'],
  ),
  TripItemTemplate(
    name: 'Flip flops',
    destinations: ['beach'],
  ),
  TripItemTemplate(
    name: 'Beach towel',
    destinations: ['beach'],
  ),
  TripItemTemplate(
    name: 'Sunglasses',
    destinations: ['beach'],
    weathers: ['sunny'],
  ),
  TripItemTemplate(
    name: 'Beach bag',
    destinations: ['beach'],
  ),

  TripItemTemplate(
    name: 'Hiking boots',
    destinations: ['mountain'],
  ),
  TripItemTemplate(
    name: 'Thermal clothing',
    destinations: ['mountain'],
    weathers: ['snowy'],
  ),
  TripItemTemplate(
    name: 'Flashlight',
    destinations: ['mountain', 'countryside'],
  ),
  TripItemTemplate(
    name: 'Waterproof jacket',
    destinations: ['mountain'],
    weathers: ['rainy', 'snowy'],
  ),

  TripItemTemplate(
    name: 'Day bag',
    destinations: ['city'],
  ),
  TripItemTemplate(
    name: 'Portable charger',
    destinations: ['city'],
  ),

  TripItemTemplate(
    name: 'Insect repellent',
    destinations: ['countryside'],
  ),
  TripItemTemplate(
    name: 'Outdoor blanket',
    destinations: ['countryside'],
  ),

  TripItemTemplate(
    name: 'Sunscreen',
    weathers: ['sunny'],
  ),
  TripItemTemplate(
    name: 'Hat',
    weathers: ['sunny'],
  ),
  TripItemTemplate(
    name: 'Light clothing',
    weathers: ['sunny'],
  ),

  TripItemTemplate(
    name: 'Umbrella',
    weathers: ['rainy'],
  ),
  TripItemTemplate(
    name: 'Waterproof shoes',
    weathers: ['rainy'],
  ),

  TripItemTemplate(
    name: 'Light jacket',
    weathers: ['cloudy'],
  ),

  TripItemTemplate(
    name: 'Winter jacket',
    weathers: ['snowy'],
  ),
  TripItemTemplate(
    name: 'Gloves',
    weathers: ['snowy'],
  ),
  TripItemTemplate(
    name: 'Scarf',
    weathers: ['snowy'],
  ),

  TripItemTemplate(
    name: 'Documents folder',
    purposes: ['business'],
  ),
  TripItemTemplate(
    name: 'Notebook',
    purposes: ['business', 'education'],
  ),
  TripItemTemplate(
    name: 'Formal clothes',
    purposes: ['business'],
  ),
  TripItemTemplate(
    name: 'Business cards',
    purposes: ['business'],
  ),

  TripItemTemplate(
    name: 'Study materials',
    purposes: ['education'],
  ),

  TripItemTemplate(
    name: 'Books',
    purposes: ['leisure'],
  ),
  TripItemTemplate(
    name: 'Travel games',
    purposes: ['leisure'],
  ),
];

// var trips = <Trip>[
//   Trip(userId: "user1", name: "Budapest B2B Conference", destination: '', purpose: '', weather: ''),
//   Trip(userId: "user1", name: "Date with Angela at Marconi`s", destination: '', purpose: '', weather: ''),
//   Trip(userId: "user1", name: "Buy new shoes", destination: '', purpose: '', weather: ''),
//   Trip(userId: "user1", name: "Buy products", destination: '', purpose: '', weather: ''),
//   Trip(userId: "user1", name: "Date with Angela at Marconi`s", destination: '', purpose: '', weather: ''),
//   Trip(userId: "user1", name: "Wash car", destination: '', purpose: '', weather: ''),
//   Trip(userId: "user1", name: "Daily meeting", destination: '', purpose: '', weather: ''),
// ];

// List<TripItem> tripItems = <TripItem>[
//   TripItem(name: "Towel", tripId: "1"),
//   TripItem(name: "Toothbrush", tripId: "1"),
//   TripItem(name: "Shampoo", tripId: "1"),
//   TripItem(name: "Shaving kit", tripId: "1"),
//   TripItem(name: "Clothes", tripId: "1"),
//   TripItem(name: "Shoes", tripId: "1"),
// ];

var destinationConditions = ['Beach', 'Mountain', 'City', 'Countryside'];
var purposeConditions = ['Leisure', 'Business', 'Education', 'Other'];
var weatherConditions = ['Sunny', 'Rainy', 'Cloudy', 'Snowy'];

// enum Location{
//   city,
//   urban,
//   cityUrban,
//   sea,
//   beach,
//   seaBeach,
//   mountains,
//   camp,
//   mountainsCamp,
//   otherCountry
// }

// enum Purpose{
//   tourism,
//   workTrip,
//   activeRelax,
//   relax,
//   spa,
// }

// enum Weather{
//   hot,
//   cold,
//   rain,
//   coldRain,
//   relax,
//   spa,
// }

// enum TripConditionType{
//   destination,
//   weather,
//   purpose,
// }
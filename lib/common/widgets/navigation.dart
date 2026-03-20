import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/AddTrip/addtrippage.dart';
import 'package:trip_assistant/features/trip/views/UpdateTrip/updatetrippage.dart';
import 'package:trip_assistant/features/trip/views/SubmitItem/submititempage.dart';
import 'package:trip_assistant/features/trip/views/TripPage/trippage.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/tripspage.dart';
import 'package:trip_assistant/features/user/views/Login/login.dart';
import 'package:trip_assistant/features/user/views/SignUp/signup.dart';

abstract class NavigationUtils {
  static void back(BuildContext context) => Navigator.pop(context);

  static void navigateToSignInPage(BuildContext context)
    => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => const LoginPage(title: 'Trip Assistant'),
    ),
  );
  
  static void navigateToSignUpPage(BuildContext context)
    => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => const SignUpPage(title: 'Trip Assistant'),
    ),
  );

  static void navigateToUserTrips(BuildContext context) 
    => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute<void>(
      builder: (context) => const TripsPage(title: 'My Trips'),
    ),
    (route) => false,
  );

  static void navigateToTripsPage(BuildContext context) 
    => Navigator.pop(
    context,
    MaterialPageRoute(
      builder: (context) => const TripsPage(title: 'My Trips'),
    ),
  );

  static void navigateToTripPage(BuildContext context, {
    required String id,
    required String title,
    required String conditionsId,
  }) => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => TripPage(
        id: id, 
        conditionsId: conditionsId, 
        name: title,
      ),
    ),
  );

  static void navigateToAddTripPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const AddTripPage(title: 'Add new Trip'),
      ),
    );
  }
  
  static void navigateToEditTripPage(BuildContext context, {
    required String id,
    required String title,
    required String tripConditionsId,
  }) => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => UpdateTripPage(
        title: title,
        id: id,
        tripConditionsId: tripConditionsId,
      ),
    ),
  );

  static void navigateToSubmitTripItemPage(BuildContext context, {
    required String id, 
    required String name, 
    required String tripId
  })
  {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => SubmitTripItemPage(
          name: name, 
          id: id,
          tripId: tripId
        ),
      ),
    );
  }
}
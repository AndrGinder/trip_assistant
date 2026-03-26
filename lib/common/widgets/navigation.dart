import 'package:flutter/material.dart';
import 'package:trip_assistant/features/trip/views/CreateTrip/create_trip_page.dart';
import 'package:trip_assistant/features/trip/views/UpdateTrip/update_trip_page.dart';
import 'package:trip_assistant/features/trip/views/SubmitItem/submititempage.dart';
import 'package:trip_assistant/features/trip/views/TripPage/trip_page.dart';
import 'package:trip_assistant/features/trip/views/TripsPage/trips_page.dart';
import 'package:trip_assistant/features/auth/views/Login/login.dart';
import 'package:trip_assistant/features/auth/views/SignUp/signup.dart';

abstract class NavigationUtils {
  static void navigateBack(BuildContext context) => Navigator.pop(context);

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

  static void navigateBackToSignInPage(BuildContext context)
    => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => const LoginPage(title: 'Trip Assistant'),
    ),
  );

  static void navigateToUserTrips(BuildContext context) 
    => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute<void>(
      builder: (context) => TripsPage(title: 'My Trips'),
    ),
    (route) => false,
  );

  static void navigateToTripsPage(BuildContext context) 
    => Navigator.pop(
    context,
    MaterialPageRoute(
      builder: (context) => TripsPage(title: 'My Trips'),
    ),
  );
  
  static void navigateBackToTripsPage(BuildContext context) 
    => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute<void>(
      builder: (context) => TripsPage(title: 'My Trips'),
    ),
    (route) => false,
  );

  static void navigateToTripPage(
    BuildContext context, {
    required String id,
    required String title,
  }) => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => TripPage(
        id: id, 
        title: title,
      ),
    ),
  );
  
  static void navigateBackToTripPage(
    BuildContext context, {
    required String id,
    required String title,
  }) 
    => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute<void>(
      builder: (context) => TripPage(
        id: id, 
        title: title,
      ),
    ),
    (route) => false,
  );

  static void navigateToAddTripPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => AddTripPage(title: 'Add new Trip'),
      ),
    );
  }
  
  static void navigateToEditTripPage(BuildContext context, {
    required String id, 
    required String title
  }) => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => UpdateTripPage(
        id: id,
        title: title,
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
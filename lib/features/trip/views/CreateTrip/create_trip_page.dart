import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/logout.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/features/auth/services/auth_service.dart';
import 'package:trip_assistant/features/trip/controllers/trip_controller.dart';
import 'package:trip_assistant/features/trip/servers/trip_item_service.dart';
import 'package:trip_assistant/features/trip/servers/trip_service.dart';
import 'package:trip_assistant/utils/constants/form.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class CreateTripPage extends StatefulWidget {
  final String title;

  final TripController controller 
    = TripController(
      tripService: TripService(), 
      tripItemService: TripItemService()
    );

  CreateTripPage({
    super.key,
    required this.title
  });

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _destination = '';
  String _purpose = '';
  String _weather = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [ LogoutButton() ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: BlockProperties.largePadding,
          horizontal: BlockProperties.mediumPadding,
        ),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: BlockProperties.thinPadding,
                        horizontal: BlockProperties.smallPadding,
                      ),
                      child: Text(
                        TripUtils.headline,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: BlockProperties.thinPadding,
                        horizontal: BlockProperties.smallPadding,
                      ),
                      child: TextFormField(
                        initialValue: _name,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: TripNameUtils.label,
                          hintText: TripNameUtils.hint,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return TripNameUtils.emptyError;
                          }
                          _name = value;
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: BlockProperties.thinPadding,
                        horizontal: BlockProperties.smallPadding,
                      ),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: TripDestinationUtils.label,
                          hintText: TripDestinationUtils.hint,
                        ),
                        items: destinationConditions.map((destination) {
                          return DropdownMenuItem<String>(
                            value: destination,
                            child: Text(destination),
                          );
                        }).toList(),
                        onChanged: (value) => _destination = value ?? '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return TripDestinationUtils.emptyError;
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: BlockProperties.thinPadding,
                        horizontal: BlockProperties.smallPadding,
                      ),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: TripPurposeUtils.label,
                          hintText: TripPurposeUtils.hint,
                        ),
                        items: purposeConditions.map((destination) {
                          return DropdownMenuItem<String>(
                            value: destination,
                            child: Text(destination),
                          );
                        }).toList(),
                        onChanged: (value) => _purpose = value ?? '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return TripPurposeUtils.emptyError;
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: BlockProperties.thinPadding,
                        horizontal: BlockProperties.smallPadding,
                      ),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: TripWeatherUtils.label,
                          hintText: TripWeatherUtils.hint,
                        ),
                        items: weatherConditions.map((destination) {
                          return DropdownMenuItem<String>(
                            value: destination,
                            child: Text(destination),
                          );
                        }).toList(),
                        onChanged: (value) => _weather = value ?? '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return TripWeatherUtils.emptyError;
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: BlockProperties.thinPadding,
                        horizontal: BlockProperties.smallPadding,
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              var trip = Trip(
                                userId: authService.value.currentUser!.uid,
                                name: _name,
                                destination: _destination,
                                purpose: _purpose,
                                weather: _weather,
                              );

                              await widget.controller
                                .createTripWithFilteredItems(trip);

                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(TripUtils.snackAdd)),
                              );

                              // ignore: use_build_context_synchronously
                              NavigationUtils.navigateBackToTripsPage(context);
                            } catch (e) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(TripUtils.snackError)),
                              );
                            }
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: BlockProperties.thinPadding,
                          ),
                          child: Text('Submit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/features/trip/controllers/create_trip_page_controller.dart';
import 'package:trip_assistant/features/trip/repositories/createTrip/create_trip.dart';
import 'package:trip_assistant/utils/constants/form.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class CreateTripPage extends StatefulWidget {
  final String title;

  final CreateTripPageController controller = CreateTripPageController(
    createTripService: CreateTrip(),
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(
          vertical: BlockProperties.thinPadding, 
          horizontal: BlockProperties.smallPadding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TripUtils.headline,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: BlockProperties.thinPadding),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
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
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: TripDestinationUtils.label,
                        hintText: TripDestinationUtils.hint,
                      ),
                      items: destinationConditions
                        .map((destination) => DropdownMenuItem<String>(
                          value: destination,
                          child: Text(destination),
                        ))
                        .toList(),
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
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: TripPurposeUtils.label,
                        hintText: TripPurposeUtils.hint,
                      ),
                      items: purposeConditions
                        .map((purpose) => DropdownMenuItem<String>(
                          value: purpose,
                          child: Text(purpose),
                        ))
                        .toList(),
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
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: TripWeatherUtils.label,
                        hintText: TripWeatherUtils.hint,
                      ),
                      items: weatherConditions
                        .map((weather) => DropdownMenuItem<String>(
                          value: weather,
                          child: Text(weather),
                        ))
                        .toList(),
                      onChanged: (value) => _weather = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TripWeatherUtils.emptyError;
                        }

                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          var tripId = await widget.controller.createRecord(
                            name: _name, 
                            destination: _destination, 
                            purpose: _purpose, 
                            weather: _weather
                          );

                          if(tripId == "0") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(TripUtils.snackError)),
                            );
                          }
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(TripUtils.snackAdd)),
                          );

                          // ignore: use_build_context_synchronously
                          NavigationUtils.navigateBackToTripsPage(context);
                        } catch(e){
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(TripUtils.snackError)),
                          );
                        }
                      }
                    }, 
                    child: Text('Submit')
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
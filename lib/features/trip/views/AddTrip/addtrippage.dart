import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/utils/constants/form.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class AddTripPage extends StatefulWidget {
  const AddTripPage({
    super.key,
    required this.title
  });

  final String title;

  @override
  State<AddTripPage> createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        try{
                          Trip newTrip = Trip(
                            userId: "user1", 
                            name: _name, 
                            destination: _destination, 
                            purpose: _purpose, 
                            weather: _weather
                          );
                          trips.add(newTrip);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(TripUtils.snackAdd)),
                          );
                          NavigationUtils.navigateBackToTripsPage(context);
                        } catch(e){
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
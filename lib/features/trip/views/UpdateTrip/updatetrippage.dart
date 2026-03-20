import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/utils/constants/form.dart';
import 'package:trip_assistant/utils/constants/models.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class UpdateTripPage extends StatefulWidget {
  final String id;
  final String title;

  const UpdateTripPage({
    super.key, 
    required this.id,
    required this.title,
  });

  @override
  State<UpdateTripPage> createState() => _UpdateTripPageState();
}

class _UpdateTripPageState extends State<UpdateTripPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _destination;
  late String _purpose;
  late String _weather;

  _UpdateTripPageState() {

    Trip trip = trips
      .firstWhere((trip) => trip.id == widget.id);

    _name = trip.name;
    _destination = trip.destination;
    _purpose = trip.purpose;
    _weather = trip.weather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: BlockProperties.thinPadding,
          vertical: BlockProperties.smallPadding,
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
                      initialValue: _destination,
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
                      onChanged: (value) => setState(() => _destination = value ?? ''),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: DropdownButtonFormField<String>(
                      initialValue: _purpose,
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
                      onChanged: (value) => setState(() => _purpose = value ?? ''),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: DropdownButtonFormField<String>(
                      initialValue: _weather,
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
                      onChanged: (value) => setState(() => _weather = value ?? ''),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        try{
                          Trip trip = trips
                            .firstWhere((trip) => trip.id == widget.id);

                          trips.removeWhere((trip) => trip.id == widget.id);
                            
                          trip.name = _name;
                          trip.destination = _destination;
                          trip.purpose = _purpose;
                          trip.weather = _weather;

                          trips.add(trip);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(TripUtils.snackUpdate)),
                          );
                          NavigationUtils.navigateBackToTripPage(
                            context, 
                            id: widget.id, 
                            title: widget.title
                          );
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
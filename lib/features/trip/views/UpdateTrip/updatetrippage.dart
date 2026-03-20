import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/utils/constants/form.dart';

class UpdateTripPage extends StatefulWidget {
  final String id;
  final String title;
  final String tripConditionsId;
  final String destination = "Destination";
  final String purpose = "Purpose";
  final String weather = "Weather";

  const UpdateTripPage({
    super.key, 
    required this.id,
    required this.title,
    required this.tripConditionsId,
  });

  @override
  State<UpdateTripPage> createState() => _UpdateTripPageState();
}

class _UpdateTripPageState extends State<UpdateTripPage> {
  final _formKey = GlobalKey<FormState>();

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
                      initialValue: widget.title,
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
                    child: TextFormField(
                      initialValue: widget.destination,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: TripDestinationUtils.label,
                        hintText: TripDestinationUtils.hint,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TripDestinationUtils.emptyError;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                      initialValue: widget.purpose,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: TripPurposeUtils.label,
                        hintText: TripPurposeUtils.hint,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TripPurposeUtils.emptyError;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                      initialValue: widget.weather,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: TripWeatherUtils.label,
                        hintText: TripWeatherUtils.hint,
                      ),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(TripUtils.snackUpdate)),
                        );
                        NavigationUtils.back(context);
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
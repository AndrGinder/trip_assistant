import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/features/trip/controllers/update_trip_page_controller.dart';
import 'package:trip_assistant/features/trip/repositories/readTrip/read_trip.dart';
import 'package:trip_assistant/features/trip/repositories/updateTrip/update_trip.dart';
import 'package:trip_assistant/utils/constants/form.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class UpdateTripPage extends StatefulWidget {
  final String id;
  final String title;

  final UpdateTripPageController controller = UpdateTripPageController(
    updateTripService: UpdateTrip(),
    readTripService: ReadTrip(),
  );

  UpdateTripPage({
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

  @override
  void initState() {
    super.initState();
    _loadTrip();
  }

  Future<void> _loadTrip() async {
    final trip = await widget.controller.readTrip(id: widget.id);

    setState(() {
      _name = trip.name;
      _destination = trip.destination;
      _purpose = trip.purpose;
      _weather = trip.weather;
    });
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                TripUtils.headline,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: BlockProperties.thinPadding),

              /// NAME
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
                  onChanged: (value) => _name = value,
                  validator: (value) =>
                      value == null || value.isEmpty
                          ? TripNameUtils.emptyError
                          : null,
                ),
              ),

              /// DESTINATION
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: BlockProperties.thinPadding,
                  horizontal: BlockProperties.smallPadding,
                ),
                child: DropdownButtonFormField<String>(
                  initialValue: destinationConditions.contains(_destination)
                      ? _destination
                      : null,
                  items: destinationConditions
                      .toSet()
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _destination = value);
                    }
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: TripDestinationUtils.label,
                  ),
                ),
              ),

              /// PURPOSE
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: BlockProperties.thinPadding,
                  horizontal: BlockProperties.smallPadding,
                ),
                child: DropdownButtonFormField<String>(
                  initialValue: purposeConditions.contains(_purpose)
                      ? _purpose
                      : null,
                  items: purposeConditions
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _purpose = value);
                    }
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: TripPurposeUtils.label,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: BlockProperties.thinPadding,
                  horizontal: BlockProperties.smallPadding,
                ),
                child: DropdownButtonFormField<String>(
                  initialValue: weatherConditions.contains(_weather)
                      ? _weather
                      : null,
                  items: weatherConditions
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _weather = value);
                    }
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: TripWeatherUtils.label,
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final id = await widget.controller.updateTrip(
                      id: widget.id,
                      name: _name,
                      destination: _destination,
                      purpose: _purpose,
                      weather: _weather,
                    );

                    if (id.isEmpty) {
                        // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(TripUtils.snackError)),
                      );
                    }
                      // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(TripUtils.snackUpdate)),
                    );

                    NavigationUtils.navigateBackToTripPage(
                      // ignore: use_build_context_synchronously
                      context,
                      id: widget.id,
                      title: widget.title,
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
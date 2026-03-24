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

class UpdateTripPage extends StatefulWidget {
  final String id;
  final String title;

  final TripController controller = TripController(
    tripService: TripService(),
    tripItemService: TripItemService(),
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

  String? _name;
  String? _destination;
  String? _purpose;
  String? _weather;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTrip();
  }

  Future<void> _loadTrip() async {
    Trip? trip = await widget.controller.getTrip(widget.id);

    setState(() {
      _name = trip!.name.isEmpty 
        ? '' 
        : trip.name;

      _destination = destinationConditions.contains(trip.destination)
        ? trip.destination
        : null;

      _purpose = purposeConditions.contains(trip.purpose)
        ? trip.purpose
        : null;

      _weather = weatherConditions.contains(trip.weather)
        ? trip.weather
        : null;

      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [ LogoutButton() ],
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
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
                            onChanged: (value) => setState(() => _name = value),
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
                            initialValue: _destination,
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
                            initialValue: _purpose,
                            isExpanded: true,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: TripPurposeUtils.label,
                              hintText: TripPurposeUtils.hint,
                            ),
                            items: purposeConditions.map((purpose) {
                              return DropdownMenuItem<String>(
                                value: purpose,
                                child: Text(purpose),
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
                            initialValue: _weather,
                            isExpanded: true,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: TripWeatherUtils.label,
                              hintText: TripWeatherUtils.hint,
                            ),
                            items: weatherConditions.map((weather) {
                              return DropdownMenuItem<String>(
                                value: weather,
                                child: Text(weather),
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

                                      // ignore: avoid_print
                                      print(widget.id);
                                      // ignore: avoid_print
                                      print(_name!);
                                      // ignore: avoid_print
                                      print(_destination!);
                                      // ignore: avoid_print
                                      print(_purpose!);
                                      // ignore: avoid_print
                                      print(_weather!);

                                  await widget.controller.updateTrip(
                                    Trip(
                                      id: widget.id,
                                      userId: authService.value.currentUser!.uid,
                                      name: _name!,
                                      destination: _destination!,
                                      purpose: _purpose!,
                                      weather: _weather!,
                                    )
                                  );

                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(TripUtils.snackUpdate)),
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
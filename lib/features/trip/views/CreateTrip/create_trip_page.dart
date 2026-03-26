import 'package:flutter/material.dart';
import 'package:trip_assistant/common/widgets/logout.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/features/auth/services/auth_service.dart';
import 'package:trip_assistant/features/trip/controllers/trip_controller.dart';
import 'package:trip_assistant/features/trip/models/trip.dart';
import 'package:trip_assistant/utils/constants/form.dart';
import 'package:trip_assistant/utils/constants/dependencies.dart';
import 'package:trip_assistant/utils/constants/trip.dart';

class AddTripPage extends StatefulWidget {
  final String title;
  final TripController controller = TripController(
    tripService: tripService,
    tripItemService: itemService,
  );

  AddTripPage({super.key, required this.title});

  @override
  State<AddTripPage> createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _destination;
  String? _purpose;
  String? _weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [LogoutButton()],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: BlockProperties.largePadding,
          horizontal: BlockProperties.mediumPadding,
        ),
        child: Form(
          key: _formKey,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: BlockProperties.thinPadding,
                      horizontal: BlockProperties.smallPadding,
                    ),
                    child: Text(
                      'Add New Trip',
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
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: TripNameUtils.label,
                        hintText: TripNameUtils.hint,
                      ),
                      onChanged: (value) => setState(() => _name = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TripNameUtils.emptyError;
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
                        border: const UnderlineInputBorder(),
                        labelText: TripDestinationUtils.label,
                        hintText: TripDestinationUtils.hint,
                      ),
                      items: destinationConditions.map((destination) {
                        return DropdownMenuItem(
                          value: destination,
                          child: Text(destination),
                        );
                      }).toList(),
                      onChanged: (value) => _destination = value,
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
                        border: const UnderlineInputBorder(),
                        labelText: TripPurposeUtils.label,
                        hintText: TripPurposeUtils.hint,
                      ),
                      items: purposeConditions.map((purpose) {
                        return DropdownMenuItem(
                          value: purpose,
                          child: Text(purpose),
                        );
                      }).toList(),
                      onChanged: (value) => _purpose = value,
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
                        border: const UnderlineInputBorder(),
                        labelText: TripWeatherUtils.label,
                        hintText: TripWeatherUtils.hint,
                      ),
                      items: weatherConditions.map((weather) {
                        return DropdownMenuItem(
                          value: weather,
                          child: Text(weather),
                        );
                      }).toList(),
                      onChanged: (value) => _weather = value,
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
                            final newTrip = Trip(
                              id: '',
                              userId: authService.value.currentUser!.uid,
                              name: _name!,
                              destination: _destination!,
                              purpose: _purpose!,
                              weather: _weather!,
                            );

                            await widget.controller.addTripWithItems(newTrip);

                            if (mounted) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Trip added successfully'),
                                ),
                              );

                              // ignore: use_build_context_synchronously
                              NavigationUtils.navigateBackToTripsPage(context);
                            }
                          } catch (e) {
                            if (mounted) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to add trip'),
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: BlockProperties.thinPadding,
                        ),
                        child: const Text('Submit'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
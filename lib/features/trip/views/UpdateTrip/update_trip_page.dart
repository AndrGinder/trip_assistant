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

class UpdateTripPage extends StatefulWidget {
  final String id;
  final String title;
  final TripController controller = TripController(
    tripService: tripService,
    tripItemService: itemService,
  );

  UpdateTripPage({super.key, required this.id, required this.title});

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
    var trip = await widget.controller.getTrip(widget.id);

    setState(() {
      _name = trip!.name;
      _destination = trip.destination;
      _purpose = trip.purpose;
      _weather = trip.weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Trip'),
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
                    child: TextFormField(
                      initialValue: _name,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: TripNameUtils.label,
                        hintText: TripNameUtils.hint,
                      ),
                      onChanged: (v) => _name = v,
                      validator: (v) =>
                          v == null || v.isEmpty ? TripNameUtils.emptyError : null,
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
                        border: const UnderlineInputBorder(),
                        labelText: TripDestinationUtils.label,
                        hintText: TripDestinationUtils.hint,
                      ),
                      items: destinationConditions
                          .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                          .toList(),
                      onChanged: (v) => _destination = v ?? '',
                      validator: (v) =>
                          v == null || v.isEmpty ? TripDestinationUtils.emptyError : null,
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
                        border: const UnderlineInputBorder(),
                        labelText: TripPurposeUtils.label,
                        hintText: TripPurposeUtils.hint,
                      ),
                      items: purposeConditions
                          .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                          .toList(),
                      onChanged: (v) => _purpose = v ?? '',
                      validator: (v) =>
                          v == null || v.isEmpty ? TripPurposeUtils.emptyError : null,
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
                        border: const UnderlineInputBorder(),
                        labelText: TripWeatherUtils.label,
                        hintText: TripWeatherUtils.hint,
                      ),
                      items: weatherConditions
                          .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                          .toList(),
                      onChanged: (v) => _weather = v ?? '',
                      validator: (v) =>
                          v == null || v.isEmpty ? TripWeatherUtils.emptyError : null,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: BlockProperties.thinPadding,
                      horizontal: BlockProperties.smallPadding,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;

                        final updatedTrip = Trip(
                          id: widget.id,
                          userId: authService.value.currentUser!.uid,
                          name: _name,
                          destination: _destination,
                          purpose: _purpose,
                          weather: _weather,
                        );

                        try {
                          await widget.controller.updateTrip(updatedTrip);

                          if (mounted) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Trip updated successfully')),
                            );
                            // ignore: use_build_context_synchronously
                            NavigationUtils.navigateBackToTripsPage(context);
                          }
                        } catch (_) {
                          if (mounted) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Failed to update trip')),
                            );
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: BlockProperties.thinPadding),
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
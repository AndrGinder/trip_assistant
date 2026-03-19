import 'package:flutter/material.dart';
import 'package:trip_assistant/common/styles/styles.dart';
import 'package:trip_assistant/common/widgets/navigation.dart';

class EditTripPage extends StatefulWidget {
  final String id;
  final String title;
  final String tripConditionsId;
  final String destination = "Destination";
  final String purpose = "Purpose";
  final String weather = "Weather";

  const EditTripPage({
    super.key, 
    required this.id,
    required this.title,
    required this.tripConditionsId,
  });

  @override
  State<EditTripPage> createState() => _EditTripPageState();
}

class _EditTripPageState extends State<EditTripPage> {
  // final _formKey = GlobalKey<FormState>();

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
              "Fill the general conditions of your trip",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: BlockProperties.thinPadding),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: BlockProperties.smallPadding,
                      vertical: BlockProperties.smallPadding
                    ),
                    child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Description',
                            hintText: 'Describe your trip in a few words',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Description is required';
                          //   }
                          //   return null;
                          // },
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Destination',
                            hintText: 'Where are you going?',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Full name is required';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Purpose',
                        hintText: 'What is the purpose of your trip?',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Full name is required';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: BlockProperties.thinPadding, 
                      horizontal: BlockProperties.smallPadding
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Weather',
                        hintText: 'What is the expected weather during your trip?',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Email is required';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Processing Data')),
                      //   );
                      // }
                      // else{
                        NavigationUtils.back(context);
                      // }
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
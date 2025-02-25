import '../../../theme/theme.dart';
import '../../../widgets/bal_button.dart';
import 'package:flutter/material.dart';
 
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
 
///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;



  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO 
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
 

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.all(BlaSpacings.m),
    padding: EdgeInsets.all(BlaSpacings.m),
    decoration: BoxDecoration(
      color: BlaColors.white,
      borderRadius: BorderRadius.circular(BlaSpacings.radius),
      boxShadow: [
        BoxShadow(
          color: BlaColors.neutralLight.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Departure Location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.circle_outlined, color: Colors.black54),
                  SizedBox(width: 10),
                  Text("Toulouse", style: TextStyle(fontSize: 16)),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.swap_vert, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(),

          // Arrival Location
          const Row(
            children: [
              Icon(Icons.radio_button_unchecked, color: Colors.black54),
              SizedBox(width: 10),
              Text("Bordeaux, France", style: TextStyle(fontSize: 16)),
            ],
          ),
          const Divider(),

          // Date
          const Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.black54),
              SizedBox(width: 10),
              Text("Sat 22 Feb", style: TextStyle(fontSize: 16)),
            ],
          ),
          const Divider(),

          // Number of Seats
          const Row(
            children: [
              Icon(Icons.person, color: Colors.black54),
              SizedBox(width: 10),
              Text("1", style: TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 20),

          // Search Button
          SizedBox(
            width: double.infinity,
            child: BlaButton(
              label: "Search", 
              isPrimary : true, 
              hasIcon: false,
               onPressed: () {}
               ),
          ),
        ],
      ),
    );
  }
}

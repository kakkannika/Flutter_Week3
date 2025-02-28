import 'package:week_3_blabla_project/screens/file_location_picker.dart';
import 'package:week_3_blabla_project/widgets/bla_button.dart';

import '../../../theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../widgets/../widgets/display/bla_divider.dart';

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

  @override
  void initState() {
    super.initState();
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }
  Future<void> _selectLocation(bool isDeparture) async {
  final location = await Navigator.push<Location>(
    context,
    MaterialPageRoute(
      builder: (context) => LocationPickerScreen(
        title: isDeparture ? 'Select Departure' : 'Select Arrival',
        initialLocation: isDeparture ? departure : arrival,
      ),
    ),
  );

  if (location != null) {
    setState(() {
      if (isDeparture) {
        departure = location;
      } else {
        arrival = location;
      }
    });
  }
 }


  void _switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  bool _isFormValid() {
    return departure != null && arrival != null && requestedSeats > 0;
  }

  void _onSearchPressed() {
    if (_isFormValid()) {
      final ridePref = RidePref(
        departure: departure!,
        arrival: arrival!,
        departureDate: departureDate,
        requestedSeats: requestedSeats,
      );
      Navigator.pop(context, ridePref);
    } else {
      // Show an error message or handle invalid form state
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields')),
      );
    }
  }

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
          // Departure Location
            InkWell( 
              onTap: () => _selectLocation(true),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.radio_button_unchecked),
                      SizedBox(width: BlaSpacings.s),
                      Text(
                          departure?.name ?? "Select Departure",
                          style: BlaTextStyles.body,
                        ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.swap_vert, color: BlaColors.primary),
                    onPressed: () {
                      _switchLocations();
                    },
                  ),
                ],
              ),
            ),

            BlaDivider(),
            SizedBox(height: BlaSpacings.s),
            // Arrival Location
            InkWell(
              onTap: () => _selectLocation(false),
              child: Row(
              children: [
                Icon(Icons.radio_button_unchecked),
                SizedBox(width: 10),
                Text(arrival?.name ?? "Select Arrival",
                    style: BlaTextStyles.body,),
              ],
            ),
            ),
            SizedBox(height: BlaSpacings.s),
            BlaDivider(),
          // Date
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.black54),
              SizedBox(width: 10),
              Text(departureDate.toLocal().toString().split(' ')[0], style: TextStyle(fontSize: 16)),
            ],
          ),
          const Divider(),

          // Number of Seats
          Row(
            children: [
              Icon(Icons.person, color: Colors.black54),
              SizedBox(width: 10),
              Text(requestedSeats.toString(), style: TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 20),

          // Search Button
          SizedBox(
            width: double.infinity,
            child: BlaButton(
              label: "Search",
              icon: Icons.search,
              isPrimary: true,
              hasIcon: false,
              color: Colors.blue,
              textStyle: TextStyle(color: Colors.black, fontSize: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: _onSearchPressed,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../model/ride/locations.dart';
import '../service/locations_service.dart';
import '../theme/theme.dart';

class LocationPickerScreen extends StatefulWidget {
  final String title;
  final Location? initialLocation;

  const LocationPickerScreen({
    super.key, 
    required this.title,
    this.initialLocation,
  });

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Location> _filteredLocations = [];
  List<Location> _recentLocations = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialLocation?.name ?? '';
    _loadRecentLocations();
    _updateSearchResults('');
  }

  void _loadRecentLocations() {
    // Simulating loading from a service or shared preferences.
    _recentLocations = LocationsService.availableLocations.take(5).toList();
  }

  // Update the list of locations based on the search query
  void _updateSearchResults(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      if (_isSearching) {
        _filteredLocations = LocationsService.availableLocations
            .where((location) =>
                location.name.toLowerCase().contains(query.toLowerCase()) ||
                location.country.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        _filteredLocations = [];
      }
    });
  }

  // Navigate back with selected location
  void _onLocationSelected(Location location) {
    Navigator.pop(context, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(BlaSpacings.m),
        child: Column(
          children: [
            // Search Bar
            _buildSearchBar(),

            // Locations List
            Expanded(
              child: _isSearching 
                  ? _buildSearchResults() 
                  : _buildRecentLocations(),
            ),
          ],
        ),
      ),
    );
  }

  // Search bar with modern design
  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8), // Adjusted margin
      padding: EdgeInsets.symmetric(horizontal: BlaSpacings.s), // Adjusted padding
      decoration: BoxDecoration(
        color: BlaColors.greyLight,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        boxShadow: [
          BoxShadow(
            color: BlaColors.neutralLight.withOpacity(0.2),
            blurRadius: 4, // Adjusted blur radius
            offset: Offset(0, 2), // Adjusted offset
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: _updateSearchResults,
        decoration: InputDecoration(
          hintText: "Search location...",
          hintStyle: TextStyle(color: BlaColors.neutralLight),
          prefixIcon: Icon(Icons.arrow_back_ios, color: BlaColors.neutralLight),
          suffixIcon: _isSearching
              ? IconButton(
                  icon: Icon(Icons.clear, color: BlaColors.neutralLight),
                  onPressed: () {
                    _searchController.clear();
                    _updateSearchResults('');
                  },
                )
              : null,
          border: InputBorder.none,
        ),
        style: BlaTextStyles.body,
      ),
    );
  }

  // Display search results based on user input
  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _filteredLocations.length,
      itemBuilder: (context, index) {
        final location = _filteredLocations[index];
        return ListTile(
          title: Text(location.name),
          subtitle: Text(location.country.name),
          onTap: () => _onLocationSelected(location),
        );
      },
    );
  }

  // Display recent locations with modern design
  Widget _buildRecentLocations() {
    return Container(); // Empty container for initial empty screen
  }

  // Build a location card with location details
  Widget _buildLocationCard(Location location) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(Icons.location_on, color: BlaColors.primary),
        title: Text(location.name, style: BlaTextStyles.body),
        subtitle: Text(location.country.name, style: BlaTextStyles.label),
        onTap: () => _onLocationSelected(location),
      ),
    );
  }
}
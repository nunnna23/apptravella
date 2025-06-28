import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For price formatting

// Import the FilterSettings class (assuming it's defined in flight_results_screen.dart or a shared file)
import '../screens/FlightResultsScreen.dart';
//import 'flight_results_screen.dart'; // Adjust import path if needed

class FilterScreen extends StatefulWidget {
  final FilterSettings initialSettings;
  final List<String>
      availableAirlines; // List of airline names like "TURKISH AIRLINES"
  final double minPriceValue;
  final double maxPriceValue;

  const FilterScreen({
    super.key,
    required this.initialSettings,
    required this.availableAirlines,
    required this.minPriceValue,
    required this.maxPriceValue,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late RangeValues _currentPriceRange;
  int? _selectedStops; // null for 'All'
  String? _selectedDepartureTime; // null for 'All'
  late Set<String> _selectedAirlines; // Set to store selected airline names

  // Define the options for chips
  final List<String> _stopOptions = ['All', 'Non-stop', '1 Stop', '2 Stop'];
  final List<String> _departureTimeOptions = [
    'All',
    'Before 11AM',
    '11AM-5PM'
  ]; // Add more if needed

  @override
  void initState() {
    super.initState();
    // Initialize state from the passed initial settings
    _currentPriceRange = widget.initialSettings.priceRange;
    _selectedStops = widget.initialSettings.selectedStops;
    _selectedDepartureTime = widget.initialSettings.selectedDepartureTime;
    _selectedAirlines =
        Set<String>.from(widget.initialSettings.selectedAirlines);

    // Ensure the initial range values are within the valid min/max from the data
    _currentPriceRange = RangeValues(
      _currentPriceRange.start
          .clamp(widget.minPriceValue, widget.maxPriceValue),
      _currentPriceRange.end.clamp(widget.minPriceValue, widget.maxPriceValue),
    );
  }

  // Helper to map display string ('Non-stop', '1 Stop') to integer value
  int? _mapStopOptionToInt(String option) {
    switch (option) {
      case 'Non-stop':
        return 0;
      case '1 Stop':
        return 1;
      case '2 Stop':
        return 2;
      default:
        return null; // 'All' maps to null
    }
  }

  // Helper to map integer value back to display string
  String _mapIntToStopOption(int? value) {
    switch (value) {
      case 0:
        return 'Non-stop';
      case 1:
        return '1 Stop';
      case 2:
        return '2 Stop';
      default:
        return 'All';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color themeBlue =
        Theme.of(context).primaryColor; // Use theme color consistently
    final NumberFormat priceFormatter =
        NumberFormat("#,##0", "en_US"); // For formatting EGP prices

    return Scaffold(
      backgroundColor: Colors.white, // White background for the whole screen
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0, // Subtle shadow
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black), // Close icon
          onPressed: () =>
              Navigator.pop(context), // Just pop without returning data
        ),
        title: const Text(
          'Filter',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Create FilterSettings object with current state
              final appliedFilters = FilterSettings(
                priceRange: _currentPriceRange,
                selectedStops: _selectedStops,
                selectedDepartureTime: _selectedDepartureTime,
                selectedAirlines: _selectedAirlines,
              );
              // Pop the screen and return the selected filters
              Navigator.pop(context, appliedFilters);
            },
            child: Text(
              'Apply',
              style: TextStyle(
                  color: themeBlue, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Price Range ---
            _buildFilterSectionTitle('Price range'),
            const SizedBox(height: 10),
            RangeSlider(
              values: _currentPriceRange,
              min: widget.minPriceValue,
              max: widget.maxPriceValue,
              // Divisions make the slider snap (optional, remove for smooth)
              // divisions: (widget.maxPriceValue - widget.minPriceValue).toInt() > 0
              //     ? (widget.maxPriceValue - widget.minPriceValue).toInt() ~/ 100 // Example: 100 divisions
              //     : 1,
              activeColor: themeBlue, // Blue for active part
              inactiveColor:
                  themeBlue.withOpacity(0.3), // Lighter blue for inactive
              labels: RangeLabels(
                'EGP${priceFormatter.format(_currentPriceRange.start.round())}',
                'EGP${priceFormatter.format(_currentPriceRange.end.round())}',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  // Ensure start is not greater than end after user interaction
                  _currentPriceRange = RangeValues(
                      values.start.clamp(widget.minPriceValue,
                          values.end), // Clamp start based on end
                      values.end.clamp(values.start,
                          widget.maxPriceValue) // Clamp end based on start
                      );
                });
              },
            ),
            // Display selected range below slider
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0), // Align with slider thumbs approx
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'EGP ${priceFormatter.format(_currentPriceRange.start.round())}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  Text(
                      'EGP ${priceFormatter.format(_currentPriceRange.end.round())}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // --- Stops ---
            _buildFilterSectionTitle('Stops'),
            const SizedBox(height: 10),
            Wrap(
              // Use Wrap for chips to flow if needed
              spacing: 8.0, // Horizontal space between chips
              runSpacing: 4.0, // Vertical space between lines of chips
              children: _stopOptions.map((option) {
                final isSelected =
                    _mapIntToStopOption(_selectedStops) == option;
                return ChoiceChip(
                  label: Text(option),
                  selected: isSelected,
                  selectedColor: themeBlue, // Blue background when selected
                  backgroundColor:
                      Colors.grey[200], // Grey background when not selected
                  labelStyle: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors.black54, // White text when selected
                    fontSize: 13,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  side: BorderSide.none, // No border
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  onSelected: (bool selected) {
                    if (selected) {
                      // Only update if selected is true
                      setState(() {
                        _selectedStops = _mapStopOptionToInt(option);
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 25),

            // --- Departure Time ---
            _buildFilterSectionTitle('Departure time'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _departureTimeOptions.map((option) {
                final isSelected = _selectedDepartureTime == option ||
                    (option == 'All' && _selectedDepartureTime == null);
                return ChoiceChip(
                  label: Text(option),
                  selected: isSelected,
                  selectedColor: themeBlue,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontSize: 13,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  side: BorderSide.none,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  onSelected: (bool selected) {
                    if (selected) {
                      setState(() {
                        _selectedDepartureTime =
                            (option == 'All') ? null : option;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 25),

            // --- Airlines ---
            _buildFilterSectionTitle('Airlines'),
            const SizedBox(height: 10),
            // Use a Column for a fixed list or ListView if very long
            Column(
              children: widget.availableAirlines.map((airlineName) {
                final bool isSelected = _selectedAirlines.contains(airlineName);
                // Find the corresponding logo asset (you might need a map or better data structure)
                // This is a simplified lookup based on the dummy data structure
                String logoAsset = 'assets/default_logo.png'; // Fallback logo
                if (airlineName == 'TURKISH AIRLINES') {
                  logoAsset = 'assets/turkish_airlines_logo.png';
                } else if (airlineName == 'EGYPTAIR')
                  logoAsset = 'assets/egyptair_logo.png';
                else if (airlineName == 'UNITED')
                  logoAsset = 'assets/united_logo.png';
                else if (airlineName == 'EMIRATES')
                  logoAsset = 'assets/emirates_logo.png';
                else if (airlineName == 'BRITISH AIRWAYS')
                  logoAsset = 'assets/ba_logo.png';
                else if (airlineName == 'QATAR AIRWAYS')
                  logoAsset = 'assets/qatar_logo.png';
                // Add other airlines here...

                return InkWell(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedAirlines.remove(airlineName);
                      } else {
                        _selectedAirlines.add(airlineName);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: isSelected
                            ? themeBlue.withOpacity(0.15)
                            : Colors.grey[
                                100], // Highlight background when selected
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: isSelected ? themeBlue : Colors.grey[300]!,
                          width: isSelected ? 1.5 : 1.0,
                        )),
                    child: Row(
                      children: [
                        // Airline Logo
                        SizedBox(
                          height: 24, // Consistent height
                          width: 80, // Fixed width for alignment
                          child: Image.asset(
                            logoAsset,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Center(
                                    child: Text(airlineName.split(' ').first,
                                        style: const TextStyle(
                                            fontSize: 9,
                                            color:
                                                Colors.red))), // Fallback text
                          ),
                        ),
                        const Spacer(), // Pushes checkbox to the right
                        // Custom Checkbox simulation
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: isSelected ? themeBlue : Colors.grey[400],
                          size: 22,
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for section titles
  Widget _buildFilterSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
    );
  }
}

import 'package:cbook_user/UI/category.dart';
import 'package:cbook_user/UI/category_list.dart';
import 'package:cbook_user/UI/home.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  String _locationMessage = "Getting location...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = "Location permissions are denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = "Location permissions are permanently denied.";
      });
      return;
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Reverse geocoding to get address from the position
    List<Placemark> placemarks = await GeocodingPlatform.instance!
        .placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      setState(() {
        _locationMessage =
            "${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
      });
    } else {
      setState(() {
        _locationMessage = "Address not found.";
      });
    }
  }

  // Screens for each tab
  static final List<Widget> _pages = <Widget>[
    const Home(),
    const Category(),
    const Center(
      child: Text("This feature is not available at the moment."),
    ),
    // const CategoryList(),
    const Center(
      child: Text("This feature is not available at the moment."),
    ),
    const Center(
      child: Text("This feature is not available at the moment."),
    ),
    const Center(
      child: Text("This feature is not available at the moment."),
    ),
  ];

  // Titles for each tab
  static const List<String?> _titles = <String?>[
    'Home',
    "online store",
    "e-commercey",
    'report, ',
    'profile',
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            const Icon(
              Icons.pin_drop,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(_locationMessage,
                      style: const TextStyle(fontSize: 11, color: Colors.white)),
                ),
                // You can add more text here if you need detailed location info
                // Text('Dhanmondi, Dhaka',
                //     style: TextStyle(fontSize: 16, color: Colors.white)),
                const Text('Bangladesh',
                    style: TextStyle(fontSize: 11, color: Colors.white)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'e-Commerce',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Online store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:cbook_user/UI/category.dart';
import 'package:cbook_user/UI/home.dart';
import 'package:cbook_user/UI/store_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  String _locationMessage = "Getting location...";
  final FloatingSearchBarController _searchBarController =
      FloatingSearchBarController();
  bool _isSearchActive = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }

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

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

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

  static final List<Widget> _pages = <Widget>[
    const Home(),
    const Category(),
    const StoreListScreen(),
    const Center(child: Text("Restaurant")),
    const Center(child: Text("Report")),
    const Center(child: Text("More")),
  ];

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
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    _locationMessage,
                    style: const TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
                const Text('Bangladesh',
                    style: TextStyle(fontSize: 11, color: Colors.white)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchActive = !_isSearchActive;
              });
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Colors.white)),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _pages[_selectedIndex],
          if (_isSearchActive)
            FloatingSearchBar(
              controller: _searchBarController,
              hint: 'Search...',
              scrollPadding: const EdgeInsets.only(top: 16),
              transitionDuration: const Duration(milliseconds: 800),
              transitionCurve: Curves.easeInOut,
              physics: const BouncingScrollPhysics(),
              axisAlignment: 0.0,
              openAxisAlignment: 0.0,
              debounceDelay: const Duration(milliseconds: 500),
              onQueryChanged: (query) {
                // Handle search query changes
              },
              closeOnBackdropTap: true,
              actions: [
                FloatingSearchBarAction(
                  showIfOpened: false,
                  child: CircularButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _isSearchActive = false;
                      });
                    },
                  ),
                ),
              ],
              builder: (context, transition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(5, (index) {
                        return ListTile(
                          title: Text('Search Result $index'),
                          onTap: () {
                            // Handle result selection
                          },
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
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

import 'package:cbook_user/UI/card/card.dart';
import 'package:cbook_user/UI/category.dart';
import 'package:cbook_user/UI/home.dart';
import 'package:cbook_user/UI/restaurant/restaurant.dart';
import 'package:cbook_user/UI/service/google_signin_example.dart';
import 'package:cbook_user/UI/service/google_signin_view.dart';
import 'package:cbook_user/UI/store_list_screen.dart';
import 'package:cbook_user/provider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:provider/provider.dart';

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
      print(placemark.street);
      print(placemark.name);
      print(placemark.postalCode);
      print(placemark.thoroughfare);
      print(placemark.subLocality);

      setState(() {
        _locationMessage =
            "${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}";
      });
    } else {
      setState(() {
        _locationMessage = "Address not found.";
      });
    }
  }

  static final List<Widget> _pages = <Widget>[
    Home(),
    Category(),
    const StoreListScreen(),
    // const Center(child: Text("Restaurant")),
    RestaurantScreen(),
    const Center(child: Text("Report")),
    // const GoogleSignInExample(),
    GoogleSignInView(),
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
                      style: const TextStyle(fontSize: 10, color: Colors.white),
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyCard()));
                },
                icon: const Icon(Icons.notifications, color: Colors.white)),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyCard()));
              },
              child: Stack(clipBehavior: Clip.none, children: [
                const IconButton(
                  onPressed: null,
                  icon:
                      Icon(Icons.shopping_cart, color: Colors.white, size: 28),
                ),
                Consumer<MyCardptovider>(
                    builder: (context, cartProvider, child) {
                  return cartProvider.cartItemCount > 0
                      ? Positioned(
                          right: 4,
                          top: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            child: Text(
                              cartProvider.cartItemCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                })
              ]),
            )
          ]),
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

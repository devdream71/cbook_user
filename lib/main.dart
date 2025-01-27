 
import 'package:cbook_user/UI/bottom_nav.dart';
import 'package:cbook_user/UI/onbroading.dart';
 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  runApp( MyApp(isFirstLaunch: isFirstLaunch));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
   const MyApp({super.key, required this.isFirstLaunch});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  isFirstLaunch ? const OnBoarding(): const BottomNav(),
    );
  }
}

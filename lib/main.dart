import 'package:cbook_user/UI/bottom_nav.dart';
import 'package:cbook_user/UI/onbroading.dart';
import 'package:cbook_user/provider/card_provider.dart';
import 'package:cbook_user/provider/favorite_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyCardptovider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isFirstLaunch ? const OnBoarding() : const BottomNav(),
      ),
    );
  }
}

// Certificate fingerprints:
//          SHA1: D5:0C:B3:A5:36:57:C9:E5:1F:A8:EA:FC:CE:05:7A:2E:88:A2:B2:9F
//          SHA256: 31:9D:47:19:F5:44:23:1D:92:8A:75:96:D4:95:D5:28:49:67:9E:0C:94:C1:1D:1B:D2:F8:61:E3:A1:34:90:58

//===> to get sha 1 key ==>
// keytool -list -v -keystore "C:\Users\Joshim\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

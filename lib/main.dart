import 'package:flutter/material.dart';
import 'models/screens/home_page.dart';
import 'models/screens/my_events_page.dart';
import 'models/screens/event_management_page.dart';
import 'models/screens/drawer_navigation.dart';
import 'models/screens/splash_screen.dart'; // Import SplashScreen

void main() {
  runApp(UnivLinkApp());
}

class UnivLinkApp extends StatelessWidget {
  const UnivLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UnivLink',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
      routes: {
        '/my-events': (context) => MyEventsPage(),
        '/event-management': (context) => EventManagementPage(),
      },
    );
  }
}

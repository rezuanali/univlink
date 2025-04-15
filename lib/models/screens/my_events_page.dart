import 'package:flutter/material.dart';
import 'drawer_navigation.dart';
import 'package:univlink/data/saved_events_data.dart'; // <-- Step 1: import shared savedEvents
import 'package:univlink/models/models/event_model.dart';

class MyEventsPage extends StatelessWidget {
  final List<String> enrolledEvents = ['Tech Fest 2025', 'Science Fair'];

  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Events'),
          bottom: TabBar(
            tabs: [Tab(text: 'Enrolled Events'), Tab(text: 'Saved Events')],
          ),
        ),
        drawer: DrawerNavigation(),
        body: TabBarView(
          children: [
            // Enrolled Events tab
            ListView.builder(
              itemCount: enrolledEvents.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(enrolledEvents[index]));
              },
            ),

            // Saved Events tab
            ListView.builder(
              itemCount: savedEvents.length,
              itemBuilder: (context, index) {
                final event = savedEvents[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(event.location),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'drawer_navigation.dart';
import 'package:univlink/models/models/event_model.dart';
import 'package:univlink/data/saved_events_data.dart';

class HomePage extends StatelessWidget {
  final List<EventModel> events = [
    EventModel(
      id: '1',
      title: 'Tech Fest 2025',
      description: 'Join us!',
      location: 'DIU Auditorium',
      date: DateTime(2025, 4, 20),
      organizer: 'Tech Club',
      isEnrollmentEnabled: true,
      goingUsers: [],
      interestedUsers: [],
      enrolledUsers: [],
    ),
    EventModel(
      id: '2',
      title: 'Art Exhibition',
      description: 'Art from DIU students.',
      location: 'Gallery Hall',
      date: DateTime(2025, 4, 25),
      organizer: 'Art Club',
      isEnrollmentEnabled: false,
      goingUsers: [],
      interestedUsers: [],
      enrolledUsers: [],
    ),
  ];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnivLink - Home'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      drawer: DrawerNavigation(),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          final isSaved = savedEvents.contains(event);

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.event, size: 40, color: Colors.blueAccent),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '📅 ${event.date.toLocal().toString().split(' ')[0]}',
                      ),
                      Text('📍 ${event.location}'),
                      Text(
                        '📊 ${event.goingUsers.length} Going, ${event.interestedUsers.length} Interested',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: () {}, child: Text('✅ Going')),
                          TextButton(
                            onPressed: () {},
                            child: Text('⭐ Interested'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: isSaved ? Colors.blue : Colors.black,
                      ),
                      onPressed: () {
                        if (isSaved) {
                          savedEvents.remove(event);
                        } else {
                          savedEvents.add(event);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

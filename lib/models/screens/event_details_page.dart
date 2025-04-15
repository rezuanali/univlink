import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../services/event_service.dart';
import 'package:intl/intl.dart';

class EventDetailsPage extends StatefulWidget {
  final String eventId;
  final String userId;

  const EventDetailsPage({super.key, required this.eventId, required this.userId});

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final EventService _eventService = EventService();
  late Future<EventModel> _event;

  @override
  void initState() {
    super.initState();
    _event = _eventService.getEventById(widget.eventId);
  }

  void _enrollInEvent() async {
    try {
      await _eventService.enrollInEvent(widget.eventId, widget.userId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have successfully enrolled in the event!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to enroll in the event')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Details')),
      body: FutureBuilder<EventModel>(
        future: _event,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Event not found.'));
          }

          final event = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(event.description),
                SizedBox(height: 8),
                Text('Location: ${event.location}'),
                SizedBox(height: 8),
                Text(
                  'Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(event.date)}',
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _enrollInEvent,
                  child: Text('Enroll in Event'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

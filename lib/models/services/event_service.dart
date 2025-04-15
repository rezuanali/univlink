import '../models/event_model.dart';

class EventService {
  // Dummy data list (you'll replace with Firebase later)
  final List<EventModel> _events = [];

  // Get all events
  List<EventModel> getEvents() {
    return _events;
  }

  // Add event
  void addEvent(EventModel event) {
    _events.add(event);
  }

  // Get enrolled events for a user
  List<EventModel> getEnrolledEvents(String userId) {
    return _events
        .where((event) => event.enrolledUsers.contains(userId))
        .toList();
  }

  // Get saved events for a user
  List<EventModel> getSavedEvents(String userId) {
    return _events
        .where((event) => event.interestedUsers.contains(userId))
        .toList();
  }

  // RSVP: Going or Interested
  void updateRSVP(String eventId, String userId, String type) {
    final index = _events.indexWhere((event) => event.id == eventId);
    if (index != -1) {
      if (type == "going") {
        _events[index].goingUsers.add(userId);
      } else if (type == "interested") {
        _events[index].interestedUsers.add(userId);
      }
    }
  }

  // Enroll a user (async)
  Future<void> enrollInEvent(String eventId, String userId) async {
    final index = _events.indexWhere((event) => event.id == eventId);
    if (index != -1 && !_events[index].enrolledUsers.contains(userId)) {
      _events[index].enrolledUsers.add(userId);
    }
  }

  // Get event by ID (async)
  Future<EventModel> getEventById(String eventId) async {
    final event = _events.firstWhere(
      (event) => event.id == eventId,
      orElse:
          () => EventModel(
            id: 'null',
            title: 'Unknown Event',
            description: 'No description available',
            location: 'Unknown location',
            date: DateTime.now(),
            organizer: 'Unknown',
            isPaid: false,
            goingUsers: [],
            interestedUsers: [],
            enrolledUsers: [],
          ),
    );

    if (event.id == 'null') {
      throw Exception('Event not found');
    }

    await Future.delayed(
      Duration(milliseconds: 300),
    ); // Optional: simulate delay
    return event;
  }
}

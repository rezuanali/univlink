import 'package:univlink/models/models/event_model.dart';

List<EventModel> eventList = [
  EventModel(
    id: '1',
    title: 'Tech Summit 2025',
    description: 'Join the biggest tech event of the year!',
    location: 'Auditorium A',
    date: DateTime(2025, 5, 20, 10, 0),
    organizer: 'Tech Club',
    isEnrollmentEnabled: true,
    goingUsers: [],
    interestedUsers: [],
    enrolledUsers: [],
    isPaid: false, // Added isPaid field
  ),
  EventModel(
    id: '2',
    title: 'Art Fiesta',
    description: 'An exhibition of student artwork and creativity.',
    location: 'Gallery Hall',
    date: DateTime(2025, 6, 5, 14, 0),
    organizer: 'Art Club',
    isEnrollmentEnabled: false,
    goingUsers: [],
    interestedUsers: [],
    enrolledUsers: [],
    isPaid: false, // Added isPaid field
  ),
];

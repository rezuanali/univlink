class EventModel {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final String organizer;
  final bool isEnrollmentEnabled;
  final int views;
  final List<String> goingUsers;
  final List<String> interestedUsers;
  final List<String> enrolledUsers;
  final bool isPaid; // Added isPaid field

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.organizer,
    this.isEnrollmentEnabled = false,
    this.views = 0,
    required this.goingUsers,
    required this.interestedUsers,
    required this.enrolledUsers,
    this.isPaid = false, // Default value for isPaid
  });

  factory EventModel.fromMap(Map<String, dynamic> data, String docId) {
    return EventModel(
      id: docId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      location: data['location'] ?? '',
      date: DateTime.parse(data['date']),
      organizer: data['organizer'] ?? '',
      isEnrollmentEnabled: data['isEnrollmentEnabled'] ?? false,
      views: data['views'] ?? 0,
      goingUsers: List<String>.from(data['goingUsers'] ?? []),
      interestedUsers: List<String>.from(data['interestedUsers'] ?? []),
      enrolledUsers: List<String>.from(data['enrolledUsers'] ?? []),
      isPaid: data['isPaid'] ?? false, // Added isPaid here for fromMap
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'location': location,
      'date': date.toIso8601String(),
      'organizer': organizer,
      'isEnrollmentEnabled': isEnrollmentEnabled,
      'views': views,
      'goingUsers': goingUsers,
      'interestedUsers': interestedUsers,
      'enrolledUsers': enrolledUsers,
      'isPaid': isPaid, // Added isPaid here for toMap
    };
  }
}

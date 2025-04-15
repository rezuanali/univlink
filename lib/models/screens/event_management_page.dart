import 'package:flutter/material.dart';
import 'package:univlink/data/event_data.dart';
import 'package:univlink/models/models/event_model.dart';
import 'drawer_navigation.dart';

class EventManagementPage extends StatefulWidget {
  const EventManagementPage({super.key});

  @override
  _EventManagementPageState createState() => _EventManagementPageState();
}

class _EventManagementPageState extends State<EventManagementPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final locationController = TextEditingController();
  final organizerController = TextEditingController();

  bool enrollmentEnabled = false;

  void addEvent() {
    final newEvent = EventModel(
      id:
          DateTime.now().millisecondsSinceEpoch
              .toString(), // Temporary unique ID
      title: titleController.text,
      description: descriptionController.text,
      location: locationController.text,
      date:
          DateTime.tryParse('${dateController.text} ${timeController.text}') ??
          DateTime.now(),
      organizer: organizerController.text,
      isEnrollmentEnabled: enrollmentEnabled,
      goingUsers: [],
      interestedUsers: [],
      enrolledUsers: [],
    );

    eventList.add(newEvent);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Event Created!')));

    Navigator.pop(context);
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Event')),
      drawer: DrawerNavigation(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: dateController,
                readOnly: true,
                onTap: _selectDate,
                decoration: InputDecoration(labelText: 'Date'),
              ),
              TextField(
                controller: timeController,
                readOnly: true,
                onTap: _selectTime,
                decoration: InputDecoration(labelText: 'Time'),
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              TextField(
                controller: organizerController,
                decoration: InputDecoration(labelText: 'Organizer'),
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('Enable Enrollment'),
                value: enrollmentEnabled,
                onChanged: (val) {
                  setState(() {
                    enrollmentEnabled = val;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: addEvent, child: Text('Save Event')),
            ],
          ),
        ),
      ),
    );
  }
}

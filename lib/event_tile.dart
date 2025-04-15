import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final VoidCallback onTap;
  final Widget? trailing;

  const EventTile({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(height: 4), Text(date), Text(location)],
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RSVPButtons extends StatelessWidget {
  final VoidCallback onGoing;
  final VoidCallback onInterested;
  final bool isGoing;
  final bool isInterested;

  const RSVPButtons({
    super.key,
    required this.onGoing,
    required this.onInterested,
    required this.isGoing,
    required this.isInterested,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onGoing,
          icon: Icon(
            Icons.check_circle,
            color: isGoing ? Colors.green : Colors.grey,
          ),
        ),
        IconButton(
          onPressed: onInterested,
          icon: Icon(
            Icons.star,
            color: isInterested ? Colors.amber : Colors.grey,
          ),
        ),
      ],
    );
  }
}

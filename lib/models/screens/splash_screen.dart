import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 3 seconds later, go to HomePage
    Timer(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 51, 161),
      body: Center(
        child: Text(
          'Welcome to UnivLink',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 244, 237, 237),
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}

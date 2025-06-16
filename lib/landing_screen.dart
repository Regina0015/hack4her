import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing'),
      ),
      body: const Center(
        child: Text('Welcome to the Landing Screen!'),
      ),
    );
  }
}

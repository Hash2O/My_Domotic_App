import 'package:flutter/material.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Gestion des appareils',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
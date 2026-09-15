import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map ({super.key});





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/p1');
              },
              child: const Text('Go to Page 1'),
            ),
            ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/loading');
          },
          child: const Text('Go to Page loading'),
      ),
          ],
        ),
      ),
    );
  }
}
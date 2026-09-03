import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Container(
          color: Colors.grey,
          margin: EdgeInsets.all(8.0),
          child: Icon(Icons.menu),
        ),
        actions: [
          Container(
            color: Colors.grey,
            margin: EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}

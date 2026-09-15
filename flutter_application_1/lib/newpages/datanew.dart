import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const new({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {

Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    return Scaffold(
      body: Expanded(
  child: ListView(
    children: [
      Text('Item 1'),
      Text('Item 2'),
      Text('Item 3'),
      Text('Item 4'),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      Text(data['message'] as String),
      
      Text('Data from API:'),
    ],
  ),
)
      
    );
  }
}
// Text(data['message'] as String),
// Text('Data from API:'),
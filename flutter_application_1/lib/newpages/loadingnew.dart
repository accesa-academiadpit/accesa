import 'package:flutter/material.dart';
import '../services/test.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void datamain() async {
    
    MainMessage instance = MainMessage(location: '/api/cart/');
    await instance.getMessage();
    print(instance.message);
    Navigator.pushReplacementNamed(context, '/data', arguments: {
      'location': instance.location,
      'message': instance.message,
    });
    
  }

  @override
  void initState() {
    super.initState();
    datamain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child:  Text('Loading...'),


      ),
    );
  }
}

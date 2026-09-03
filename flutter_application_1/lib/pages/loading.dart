import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_application_1/services/test.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void bomb() {
    Future.delayed(Duration(seconds: 1), () {
      print('3');
    });
    Future.delayed(Duration(seconds: 2), () {
      print('2');
    });
    Future.delayed(Duration(seconds: 3), () {
      print('1');
    });
    Future.delayed(Duration(seconds: 5), () {
      print('BOOM!?!?!?!');
    });
  }

  void getData2() async {
    // Response response =await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Response response =await get(Uri.parse('http://10.0.2.2:8000/api/posts'));//apitestsupa
    // Response response =await get(Uri.parse('https://gateway.timeapi.world/timezone/America/New_York'));
    Map data = jsonDecode(response.body);
    print(data);
    // print(data.keys); 
  }
  
  void datamain() async {
    MainMessage instance = MainMessage(location: '/api');
    await instance.getMessage();
    print(instance.message);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'message': instance.message,
    });
    // print(instance.time);
    // setState((){
    //   time= instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    datamain();
    // getData();
    // bomb();
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

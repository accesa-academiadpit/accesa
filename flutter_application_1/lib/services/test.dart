import 'package:http/http.dart';
import 'dart:convert';
// import 'package:intl/intl.dart';

class MainMessage {
  String location; //the time in that location
  String message = ''; //the time in that location

  
  MainMessage({required this.location});

  Future<void> getMessage() async {

    try {

      Response response =await get(Uri.parse('http://10.0.2.2:8000$location'));
            Map data = jsonDecode(response.body);
            message=data['message'];

    }
    catch (e) {

      print('caught error: $e');
      message = 'could not get message data';

    }
  }
}


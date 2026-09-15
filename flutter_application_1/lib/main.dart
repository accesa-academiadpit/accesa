// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'newpages/p1.dart';
import 'newpages/p0.dart';
import 'newpages/loadingnew.dart';
import 'newpages/datanew.dart';
  


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // try {
  //   final response = await http.get(
  //     Uri.parse('http://127.0.0.1:8000/api/cart/'),
  //   );

  //   print('==============================');
  //   print('STATUS: ${response.statusCode}');
  //   print('BODY: ${response.body}');
  //   print('==============================');

  //   final data = jsonDecode(response.body);
  //   print('DATA: $data');
  // } catch (e) {
  //   print('==============================');
  //   print('API ERROR: $e');
  //   print('==============================');
  // }

//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('API Tesa'),
//         ),
//       ),
//     ),
//   );
// }
runApp(
 MaterialApp(
      initialRoute: '/p0',
      routes: {
        '/p0': (context) => Map(),
        '/p1': (context) => WasteLessApp(),
        '/loading': (context) => Loading(),
        '/data': (context) => Data(),
      },
 ),
    );
}

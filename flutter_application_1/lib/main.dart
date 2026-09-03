import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/chose_location.dart';
import 'pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  // home: HomePage(),
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChoseLocation(),
  },
));







// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(fontFamily: 'Poppins'),
//       home: HomePage(),
//     );
//   }
// }

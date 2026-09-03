// import 'package:flutter/material.dart';
// import 'second.dart';
// import 'package:http/http.dart' as http;


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String _data = '';

//   void _callApi() async {
//     // Note: Use 'http://10.0.2.2:8080/api' if using an Android Emulator
//     final res = await http.get(Uri.parse('http://10.0.2.2:8000/api'));
    
//     setState(() => _data = res.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hossssssme Page'),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         leading: Container(
//           color: Colors.grey,
//           margin: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             child: const Text('Go to Second Page'),
//             onPressed: () {
//             // Navigate to SecondPage
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SecondPage()),
//               );
//           },),
//         ),
//         actions: [
//           Container(
//             color: Colors.grey,
//             margin: const EdgeInsets.all(8.0),
//             child: const Icon(Icons.menu),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_data),
//             Text(_data),
//             Text(_data),
//             Text(_data),
//             ElevatedButton(
//               onPressed: _callApi,
//               child: const Text('Call /api'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
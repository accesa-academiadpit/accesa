import 'package:flutter/material.dart';
// import 'SecondPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed:(){
                Navigator.pushNamed(context, '/location');
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.edit_location),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  )
                )
              ]
            ),
          ]
        )
      )
    );
  }
}


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Page')),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Go to Second Page'),
//           onPressed: () {
//             // Navigate to SecondPage
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const SecondPage()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
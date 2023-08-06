import 'dart:async';

import 'package:c_clinic/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_page.dart';

const clinic_color = Color.fromARGB(255, 41, 75, 43);

void main() async {
  //WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위함
  //await Firebase.initializeApp(); // firebase 앱 시작
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

// //첫 로딩 화면 (제작 중)
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//       Duration(seconds: 4),
//       () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/images/rogo.png'), fit: BoxFit.contain),
//       ),
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//             top: 0.0,
//             left: 0.0,
//             child: Container(
//               width: width,
//               height: height,
//               child: Scaffold(
//                 backgroundColor: Colors.transparent,
//                 body: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Center(),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

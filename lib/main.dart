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
      home: LoginPage(),
    );
  }
}

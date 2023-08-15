import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'main.dart';

class WeekPage extends StatefulWidget {
  const WeekPage({Key? key}) : super(key: key);

  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "c-clinic",
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 15.0,
        backgroundColor: clinic_color,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 60, 0, 0),
              child: Text(
                "주간의 경고",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

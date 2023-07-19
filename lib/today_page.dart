import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'main.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);
  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int _count = 0;
    // const color_red = Colors.red;

    // MaterialColor _check_Color(_count) {
    //   //var color_list = List<int>.filled(2, 0);

    //   if (_count >= 10 && _count < 20) {
    //     Color color_red = Colors.red;
    //     return color_red;
    //   }
    // }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(35, 60, 0, 0),
            child: Text(
              "오늘의 경고",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: SizedBox(
                child: Column(
              children: [
                if (_count < 10)
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 50),
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 211, 250, 212),
                                  Color.fromARGB(255, 81, 221, 86)
                                ]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            )),
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              '$_count', //경고 횟수
                              style:
                                  TextStyle(fontSize: 60, color: Colors.black),
                            ),
                          ),
                        )),
                  )
                else if (_count >= 10 && _count < 20)
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 50),
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 253, 240, 218),
                                  Color.fromARGB(255, 255, 171, 35)
                                ]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            )),
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              '$_count', //경고 횟수
                              style:
                                  TextStyle(fontSize: 60, color: Colors.black),
                            ),
                          ),
                        )),
                  )
                else
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 50),
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 255, 228, 228),
                                  Color.fromARGB(255, 239, 56, 56)
                                ]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            )),
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              '$_count', //경고 횟수
                              style:
                                  TextStyle(fontSize: 60, color: Colors.black),
                            ),
                          ),
                        )),
                  )
              ],
            )),
          ),
        ],
      ),
    );
  }
}

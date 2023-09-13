import 'dart:js_interop';

import 'package:c_clinic/today_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'login_page.dart';
import 'main.dart';
import 'setting_page.dart';
import 'week_page.dart';
import 'chatbot_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController jobController = TextEditingController();

  bool isOn = false;
  bool isLoading = false;
  String _str = '고부기를 눌러 카메라 on';

  void _onPressed(BuildContext context) {
    if (isLoading) {
      return; // 이미 로딩 중이면 아무것도 하지 않음
    }

    setState(() {
      //isOn = !isOn; // toggle isOn 상태
      if (isOn == true) {
        isLoading = true;
        _str = "고부기를 눌러 카메라 off";
      } // 로딩 상태 시작
      else if (isOn == false) {
        _str = "고부기를 눌러 카메라 on";
      }
    });

    // 10초 동안 로딩을 표시한 후에 로딩을 종료
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        isLoading = false; // 로딩 상태 종료
      });
    });

    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // 나머지 처리 코드는 여기에 넣으세요
  }

  //String _str = '';

  // void _onPressed(BuildContext context) {
  //   if (isOn == true) {
  //     _str = '카메라가 켜졌어요!';
  //   } else if (isOn == false) {
  //     _str = '카메라가 꺼졌어요!';
  //   }

  //   var snackBar = SnackBar(
  //     content: Text(
  //       '$_str',
  //       textAlign: TextAlign.center,
  //     ),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     width: 150,
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "c-clinic",
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: clinic_color,
        actions: [
          TextButton(
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              //print("sign out");
              // 환경설정페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            IconButton(
                //today
                iconSize: 120.0,
                onPressed: () {
                  isOn = !isOn; //toggle
                  _onPressed(context);
                },
                icon: Image.asset(
                  'assets/images/rogo.png',
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                '$_str',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 78, 78, 78),
                ),
              ),
            ),
            Container(
              width: 390,
              height: 130,
              margin: EdgeInsets.only(top: 110),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        //today
                        iconSize: 100.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TodayPage()),
                          );
                        },
                        icon: Image.asset(
                          'assets/images/today.png',
                        )),
                    IconButton(
                        //week
                        iconSize: 100.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WeekPage()),
                          );
                        },
                        icon: Image.asset(
                          'assets/images/week.png',
                        )),
                    IconButton(
                        //chatbot
                        iconSize: 100.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatbotPage()),
                          );
                        },
                        icon: Image.asset(
                          'assets/images/chatbot.png',
                        )),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
      // 모달 다이얼로그
      floatingActionButton: isLoading
          ? Stack(
              children: [
                ModalBarrier(
                  color: Colors.black.withOpacity(0.4),
                  dismissible: false,
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        '카메라를 보며 정자세를 유지해 주세요.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            )
          : null,
    );
  }
}

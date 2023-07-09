import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'main.dart';
import 'setting_page.dart';

/// 홈페이지
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              print("sign out");
              // 로그인 페이지로 이동
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
            Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rogo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "       '고부기와 함께\n바른 자세를 만들어봐요.'",
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
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/today.png',
                        )),
                    IconButton(
                        //week
                        iconSize: 100.0,
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/week.png',
                        )),
                    IconButton(
                        //chatbot
                        iconSize: 100.0,
                        onPressed: () {},
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
    );
  }
}

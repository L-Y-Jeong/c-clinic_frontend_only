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
    int _count = 20;
    // const color_red = Colors.red;

    // MaterialColor _check_Color(_count) {
    //   //var color_list = List<int>.filled(2, 0);

    //   if (_count >= 10 && _count < 20) {
    //     Color color_red = Colors.red;
    //     return color_red;
    //   }
    // }

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "c-clinic",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context); //뒤로가기
              },
              icon: Icon(Icons.arrow_back),
            ),
            centerTitle: true,
            elevation: 15.0,
            backgroundColor: clinic_color,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'count',
                ),
                Tab(text: 'report'),
              ],
            ),
          ),
          body: TabBarView(children: [
            Column(
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
                                    style: TextStyle(
                                        fontSize: 60, color: Colors.black),
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
                                    style: TextStyle(
                                        fontSize: 60, color: Colors.black),
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
                                    style: TextStyle(
                                        fontSize: 60, color: Colors.black),
                                  ),
                                ),
                              )),
                        )
                    ],
                  )),
                ),
              ],
            ),
            CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: false,
                  expandedHeight: 100.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      '오늘의 경고 기록',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 80.0,
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      //color: Colors.purple[100 * (index % 10)],
                      child: Text(
                        '$index 회 | 00:00:00',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 113, 113, 113)),
                      ),
                    );
                  }, childCount: 30),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

import 'dart:html';

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
    int _count = 10; //경고횟수 일단 지정해놓음(이제 파이어베이스에서 가져와야함)
    var hours = List.empty(growable: true); //시 빈 리스트 생성
    var minutes = List.empty(growable: true); //분 빈 리스트 생성

    hours.add(9);
    hours.add(9);
    hours.add(10);
    hours.add(11);
    hours.add(12);
    hours.add(12);
    hours.add(12);
    hours.add(15);
    hours.add(16);
    hours.add(18);

    minutes.add(12);
    minutes.add(35);
    minutes.add(50);
    minutes.add(5);
    minutes.add(25);
    minutes.add(43);
    minutes.add(52);
    minutes.add(53);
    minutes.add(12);
    minutes.add(27);

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          /* App Bar*/
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
          /* body */
          body: TabBarView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
              children: [
                /* 오늘의 경고 text */
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
                /* 오늘의 경고 count 보여주는 창 */
                Center(
                  child: SizedBox(
                      child: Column(
                    children: [
                      if (_count < 10) //count가 10보다 작으면, 원 색깔 = 초록
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
                      else if (_count >= 10 &&
                          _count < 20) // 10 < count < 20 이면, 원 색깔 = 주황
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
                      else //count가 20보다 크면, 원 색깔 = 빨강
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
            /* 오늘의 경고의 기록 보여주는 창 */
            CustomScrollView(
              slivers: <Widget>[
                // 오늘의 경고 text
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
                // 오늘의 경고 list report
                // if (_count == 0)
                //   (Container(height: 80, child: Text('오늘의 경고 없음')))
                // else if (_count > 0)

                SliverFixedExtentList(
                  itemExtent: 80.0, //리스트 한 칸 넓이
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    // var h = hours[index].toString();
                    // var h_S = h.padLeft(2, "0");
                    // var m = minutes[index].toString();
                    // var m_S = m.padLeft(2, "0");
                    index += 1;
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.lightGreen[100 * ((index - 1) % 10)],
                      child: Text(
                        '$index 회 | ${hours[index - 1]} : ${minutes[index - 1]}', //hours, minutes 출력
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 59, 59, 59)
                            // color: const Color.fromARGB(255, 155, 155, 155)
                            ),
                      ),
                    );
                  }, childCount: _count), //화면에 나오는 list index 개수
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

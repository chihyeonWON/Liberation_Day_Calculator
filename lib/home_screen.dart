import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:loveday/Image/vanleon.dart';
import 'package:loveday/Image/archaeum.dart';
import 'package:loveday/Image/magnus.dart';
import 'package:loveday/Image/seuu.dart';
import 'package:loveday/Image/demian.dart';
import 'package:loveday/Image/will.dart';
import 'package:loveday/Image/lucid.dart';
import 'package:loveday/Image/jinheila.dart';
import 'package:loveday/Image/darkmagician.dart';

// 쿠퍼티노(iOS) 위젯을 사용하기 위해 필요
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime liberationDay = DateTime.now();

  DateTime now = DateTime.now();

  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    setYear().whenComplete(() {
      setState(() {});
    });
    setMonth().whenComplete(() {
      setState(() {});
    });
    setDay().whenComplete(() {
      setState(() {});
    });
  }

  Future setYear() async {
    prefs = await SharedPreferences.getInstance(); // 사용자의 저장소에 connection
    int? year = prefs!.getInt('year');
    return Text('$year', style:const TextStyle(fontSize:50.0),
    );
  }

  Future setMonth() async {
    prefs = await SharedPreferences.getInstance(); // 사용자의 저장소에 connection
    int? month = prefs!.getInt('month');
    return Text('$month', style: const TextStyle(fontSize:50.0),
    );
  }

  Future setDay() async {
    prefs = await SharedPreferences.getInstance(); // 사용자의 저장소에 connection
    int? day = prefs!.getInt('day');
    return Text('$day', style: const TextStyle(fontSize:50.0),
    );
  }

  void onHeartPressed() {
    showCupertinoDialog( // 쿠퍼티노 다이얼로그 실행
      context: context,
      builder: (BuildContext context) {
        // 날짜 선택하는 다이얼로그
        return Align(
          alignment:Alignment.bottomCenter, // 아래 중간으로 정렬
          child: Container(
            color:Colors.white, // 배경색 흰색 지정
            height:300, // 높이 300 지정
            child: CupertinoDatePicker(
              minimumDate: DateTime(now.year,now.month,now.day),
              // 시간 제외하고 날짜만 선택하기
              mode: CupertinoDatePickerMode.date,
              // 날짜가 변경되면 실행되는 함수
              onDateTimeChanged: (DateTime date) async {
                prefs = await SharedPreferences.getInstance();
                prefs!.setInt('year', date.year);
                prefs!.setInt('month', date.month);
                prefs!.setInt('day', date.day);
                setState(() {
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true, // 외부 탭할 경우 다이얼로그 닫기
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black, // 핑크 배경색 적용
        body: SafeArea( // 시스템 UI 피해서 UI 그리기
            top: true,
            bottom:false,
            child:Column(
              // 위아래 끝에 위젯 배치
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // 반대축 최대 크기로 늘리기
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  const SizedBox(
                    height:50,
                  ),
                  Row(
                    children: [
                      Text(
                        '해방 : ',
                        style:TextStyle(fontSize:50.0,),
                      ),
                      FutureBuilder(
                        future:setYear(),
                        builder:(context,snapshot) {
                          if(snapshot.hasData) {
                            return snapshot.data;
                          }
                          return const Text('년도를 선택하세요');
                        }
                      ),
                      const Text('.', style:TextStyle(fontSize:50.0)),
                      FutureBuilder(
                          future:setMonth(),
                          builder:(context,snapshot) {
                            if(snapshot.hasData) {
                              return snapshot.data;
                            }
                            return const Text('월을 선택하세요');
                          }
                      ),
                      const Text('.', style:TextStyle(fontSize:50.0)),
                      FutureBuilder(
                          future:setDay(),
                          builder:(context,snapshot) {
                            if(snapshot.hasData) {
                              return snapshot.data;
                            }
                            return const Text('일을 선택하세요');
                          }
                      ),
                    ],
                  ),
                  const SizedBox(
                    height:70,
                  ),
                  Text( //
                    '남은 날 : ${DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).difference(DateTime(now.year, now.month, now.day)).inDays}일',
                    style: TextStyle(
                      fontSize: 50.0,
                    )
                  ),
                  const SizedBox(
                    height:70,
                  ),
                  ElevatedButton(
                    onPressed: onHeartPressed,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('해방예정일 선택하기',
                          style: TextStyle(fontSize:30.0,)
                      ),
                    ),
                  ),
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 0)
                    const DarkmagicianImage(), // 해방
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 1)
                    const JinheilaImage(), // 진힐라
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 2)
                    const LucidImage(), // 루시드
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 3)
                    const WillImage(), // 윌
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 4)
                    const DemianImage(), // 데미안
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 5)
                    const SeuuImage(), // 스우
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 6)
                    const MagnusImage(), // 매그너스
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 7)
                    const ArchaeumImage(), // 아카이럼
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month == 8)
                    const VanleonImage(), // 반레온
                  if(DateTime(prefs!.getInt('year')!.toInt(), prefs!.getInt('month')!.toInt(), prefs!.getInt('day')!.toInt()).month - DateTime(now.year, now.month, now.day).month > 8)
                    const SingleChildScrollView(
                      padding: EdgeInsets.only(top: 100.0, bottom:100.0,),
                      child: const Text('해방일은 해방을 시작한 달부터 8개월 뒤입니다.',
                          style: TextStyle(fontSize: 40)
                      ),
                    )
                ],
            )
        )
    );
  }
}



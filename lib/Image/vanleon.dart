import 'package:flutter/material.dart';
import 'package:loveday/home_screen.dart';

class VanleonImage extends StatefulWidget {
  const VanleonImage({Key? key}) : super(key: key);

  @override
  State<VanleonImage> createState() => _VanleonImageState();
}

class _VanleonImageState extends State<VanleonImage> {

  /* Dialog 띄우기 */
  void showDialogPop() {
    showDialog(
      context: context,
      barrierDismissible:
      false, //다이얼로그 바깥을 터치 시에 닫히도록 하는지 여부 (true: 닫힘, false: 닫히지않음)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            //제목 정의
            '군단장 반레온',
          ),
          content: SingleChildScrollView(
            //내용 정의
            child: ListBody(
              children: <Widget>[
                Text(
                  '봉인된 제네시스 무기와 보조무기만 장착',
                ),
                Text(
                  '착용 중인 장비의 순수 능력치만 적용',
                ),
                Text(
                  '최종 데미지 90% 감소',
                ),
                Text(
                  '혼자서 격파',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            //버튼 정의
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 현재 화면을 종료하고 이전 화면으로 돌아가기
              },
              child: Text(
                '취소',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: InkWell(
            onTap:showDialogPop,
            child: Image.asset(
              'asset/img/vanleon.png',

              // 화면의 반만큼 높이 구현
              height: MediaQuery.of(context).size.height/2,
            ),
          ),
      ),
    );
  }
}


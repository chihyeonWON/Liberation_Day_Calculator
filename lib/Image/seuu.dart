import 'package:flutter/material.dart';

class SeuuImage extends StatefulWidget {
  const SeuuImage({Key? key}) : super(key: key);

  @override
  State<SeuuImage> createState() => _SeuuImageState();
}

class _SeuuImageState extends State<SeuuImage> {

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
            '군단장 스우',
          ),
          content: SingleChildScrollView(
            //내용 정의
            child: ListBody(
              children: <Widget>[
                Text(
                  '최종 데미지 20% 감소',
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
              'asset/img/seuu.png',

              // 화면의 반만큼 높이 구현
              height: MediaQuery.of(context).size.height/2,
            ),
          )
      ),
    );
  }
}


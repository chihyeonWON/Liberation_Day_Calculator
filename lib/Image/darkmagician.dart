import 'package:flutter/material.dart';

class DarkmagicianImage extends StatefulWidget {
  const DarkmagicianImage({Key? key}) : super(key: key);

  @override
  State<DarkmagicianImage> createState() => _DarkmagicianImageState();
}

class _DarkmagicianImageState extends State<DarkmagicianImage> {

  /* Dialog 띄우기 */
  void showDialogPop() {
    showDialog(
      context: context,
      barrierDismissible:
      false, //다이얼로그 바깥을 터치 시에 닫히도록 하는지 여부 (true: 닫힘, false: 닫히지않음)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Text(
                //제목 정의
                '해방을 축하드립니다!',
              ),
              Text(
                //제목 정의
                '해방 시 무기 옵션을 알려드립니다!',
              ),
            ],
          ),
          content: SingleChildScrollView(
            //내용 정의
            child: ListBody(
              children: <Widget>[
                Text(
                  '본인 캐릭터의 주 스탯에 맞는 주문의 흔적 15% 완작',
                ),
                Text(
                  '스타포스 22성',
                ),
                Text(
                  '유니크 잠재능력 및 에픽 에디셔널 잠재능력',
                ),
                Text(
                  '특수 스킬(창조의 아이온, 파괴의 얄다바오트)',
                ),
                Text(
                  '럭키아이템 효과',
                ),
                Text(
                  '강화 불가',
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
              'asset/img/darkmagician.png',

              // 화면의 반만큼 높이 구현
              height: MediaQuery.of(context).size.height/2,
            ),
          )
      ),
    );
  }
}


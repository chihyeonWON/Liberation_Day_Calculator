import 'package:flutter/material.dart';

class DarkmagicianImage extends StatelessWidget {
  const DarkmagicianImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child:
          Image.asset(
            'asset/img/darkmagician.png',

            // 화면의 반만큼 높이 구현
            height: MediaQuery.of(context).size.height/2,
          )
      ),
    );
  }
}
import 'package:flutter/material.dart';

class WillImage extends StatelessWidget {
  const WillImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child:
          Image.asset(
            'asset/img/will.png',

            // 화면의 반만큼 높이 구현
            height: MediaQuery.of(context).size.height/2,
          )
      ),
    );
  }
}
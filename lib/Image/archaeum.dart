import 'package:flutter/material.dart';

class ArchaeumImage extends StatelessWidget {
  const ArchaeumImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child:
          Image.asset(
            'asset/img/archaeum.png',

            // 화면의 반만큼 높이 구현
            height: MediaQuery.of(context).size.height/2,
          )
      ),
    );
  }
}
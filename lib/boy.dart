import 'dart:math';
import 'package:flutter/material.dart';

class MyBoy extends StatelessWidget {
  final int boySpriteCount; // between 1~2
  final String boyDirection;

  MyBoy({
    this.boySpriteCount,
    this.boyDirection,
  });

  @override
  Widget build(BuildContext context) {
    int directionAsInt = 1;

    return Container(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi * directionAsInt),
        child: Image.asset(
          'assets/images/standboy' +
              (boySpriteCount % 2 + 1).toString() +
              '.png',
        ),
      ),
    );
  }
}

import 'boy.dart';
import 'dart:async';
import 'button.dart';
import 'package:flutter/material.dart';

import 'dash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: DashBoardPage(),
      //home: MyHomePage(),
    );
  }
}

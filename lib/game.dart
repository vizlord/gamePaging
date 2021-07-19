import 'package:flutter/material.dart';
import 'boy.dart';
import 'dart:async';
import 'button.dart';

class Game extends StatefulWidget {
  const Game({Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  // Loading Screen
  var loadingScreenColor = Colors.blue[100];
  var loadingScreenTextColor = Colors.blue[700];
  var tapToPlayColor = Colors.white;
  int loadingTime = 3;
  bool gameHasStarted = false;
  bool currentlyLeveling = false;

  // BOY CHARACTER
  int boySpriteCount = 2;
  double boyPosX = -0.2;
  double boyPosY = 1;
  String boyDirection = 'left';
  int attackBoySpriteCount = 0;
  bool currentlySmiling = false;

  void playNow() {
    startGameTimer();
  }

  void startGameTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        loadingTime--;
      });
      if (loadingTime == 0) {
        setState(() {
          loadingScreenColor = Colors.transparent;
          loadingTime = 3;
          loadingScreenTextColor = Colors.transparent;
        });
        timer.cancel();
      }
    });
  }

  void jump() {
    double time = 0;
    double height = 0;
    double initialHeight = boyPosY;
    Timer.periodic(Duration(milliseconds: 70), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.5 * time;

      setState(() {
        if (initialHeight - height > 1) {
          boyPosY = 1;
          timer.cancel();
          boySpriteCount = 1;
        } else {
          boyPosY = initialHeight - height;
          boySpriteCount = 2;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                if (gameHasStarted == false) {
                  playNow();
                  tapToPlayColor = Colors.transparent;
                  gameHasStarted = true;
                }
              },
              child: Container(
                color: Colors.blue[300],
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment(boyPosX, boyPosY),
                      child: MyBoy(
                        boyDirection: boyDirection,
                        boySpriteCount: boySpriteCount % 2 + 1,
                        attackBoySpriteCount: attackBoySpriteCount,
                        currentlyLeveling: currentlyLeveling,
                        smile: currentlySmiling,
                      ),
                    ),
                    Container(
                      color: loadingScreenColor,
                      child: Center(
                        child: Text(loadingTime.toString(),
                            style: TextStyle(
                                color: loadingScreenTextColor, fontSize: 70)),
                      ),
                    ),
                    Container(
                      alignment: Alignment(0, 0.4),
                      child: Text('T A P   T O   P L A Y',
                          style:
                          TextStyle(color: tapToPlayColor, fontSize: 25)),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.indigoAccent[700],
          ),
          Expanded(
            child: Container(
              color: Colors.grey[500],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyButton(
                        text: 'Jump',
                        function: () {
                          jump();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

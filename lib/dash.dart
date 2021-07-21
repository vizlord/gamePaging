import 'dart:ui';
import 'package:fello/paging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game.dart';


class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 2, vsync: this); // vsync --> SingleTicker ProviderStateMixin
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xff28313b),
      decoration: BoxDecoration(
          gradient: RadialGradient(radius: 1, colors: [
            Color(0xff2F6CFF),
            Color(0xff07152F),
            //0xff2E5D92
          ])),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fello Test'),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Text(
                  'Vishal Gore',
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                color: Colors.black45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TabBar(
                      enableFeedback: true,
                      controller: tabController,
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white.withOpacity(0.7),
                      labelStyle: GoogleFonts.notoSans(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                      unselectedLabelStyle: GoogleFonts.notoSans(
                          fontSize: 12.0, fontWeight: FontWeight.w500),
                      tabs: [
                        Tab(child: Text('Game')),
                        Tab(child: Text('Paging')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  205.0, // increase the side of scroll
              child: TabBarView(
                  controller: tabController, children: [
                Game(),
                Paging(),
              ]),
            )
          ],
        ),
      ),
    );

  }
}

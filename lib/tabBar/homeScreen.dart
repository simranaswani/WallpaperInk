import 'package:MoneyLotto/games/titles.dart';
import 'package:MoneyLotto/video.dart';
import 'package:MoneyLotto/wallet.dart';
import 'package:MoneyLotto/themes/appTheme2.dart';
import 'package:flutter/material.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'dart:async';
import 'package:MoneyLotto/home/homeNew.dart';
import 'package:MoneyLotto/tabBar/rewardsTabIconData.dart';
import 'package:MoneyLotto/tabBar/tabBarNew.dart';


class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
   AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme2.background,
  );

  @override
  void initState() {
    BackButtonInterceptor.add(myInterceptor);
    tabIconsList.forEach((tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    super.initState();
  }

 bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }
  
  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme2.background,
      child: Scaffold(
             floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Color(0xFFF17532),
      child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
       
      ],
    );
  }
}

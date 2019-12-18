import 'package:MoneyLotto/walletNew.dart';
import 'package:flutter/material.dart';

import '../games/titles.dart';
import '../home/homeNew.dart';
import '../video.dart';
import '../wallet.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeNewScreen(),
                                  ),
                                );
                              },
                              child:
                                  Icon(Icons.home, color: Color(0xFFEF7532))),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DesignCourseHomeScreen(),
                                  ),
                                );
                              },
                              child: Icon(Icons.person_outline,
                                  color: Color(0xFF676E79)))
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        GestureDetector(
                          onTap: ()
{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoList(),
                                  ),
                                );
                             
                          },
                          child: Icon(Icons.search, color: Color(0xFF676E79))),
                          GestureDetector(
                            onTap:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CryptoWallet(),
                                  ),
                                );
                              },
                            child: Icon(Icons.shopping_basket, color: Color(0xFF676E79)))
                        ],
                      )),
                ])));
  }
}

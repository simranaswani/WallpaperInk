import 'package:flutter/material.dart';
import 'package:MoneyLotto/home/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:MoneyLotto/tabBar/tabBarNew.dart';

class HomeNewScreen extends StatefulWidget {
  final String currentUserId;

    HomeNewScreen({Key key, @required this.currentUserId}) : super(key: key);
  @override
  _HomeNewScreenState createState() => _HomeNewScreenState(currentUserId: currentUserId);
}

class _HomeNewScreenState extends State<HomeNewScreen> {
  _HomeNewScreenState({Key key, @required this.currentUserId});
 final String currentUserId;

  Widget coins(BuildContext context) {
    if (currentUserId!= '') {
      return new StreamBuilder(
          stream:
              Firestore.instance.collection('users').document(currentUserId).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return RichText(
                text: TextSpan(
                  text: "Loading",
                  style: Theme.of(context).textTheme.headline.apply(
                      color: Colors.blue,
                      fontFamily: "Netflix",
                      fontWeightDelta: 2),
                ),
              );
            }
            var userDocument = snapshot.data;
            return RichText(
              text: TextSpan(
                text: userDocument["coins"].toString() + ' coins',
                style: Theme.of(context).textTheme.headline.apply(
                    color: Colors.blue,
                    fontFamily: "Netflix",
                    fontWeightDelta: 2),
              ),
            );
          });
    } else if (currentUserId == '') {
      TextSpan(
        text: "Loading",
        style: Theme.of(context).textTheme.headline.apply(
            color: Colors.blue, fontFamily: "Netflix", fontWeightDelta: 2),
      );
    }
  }

  Widget name(BuildContext context) {
    if (currentUserId != '') {
      return new StreamBuilder(
          stream:
              Firestore.instance.collection('users').document(currentUserId).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text(
                "Loading",
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.blue, fontWeightDelta: 2),
              );
            }
            var userDocument = snapshot.data;
            return Text(
              userDocument["full_name"].toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .apply(color: Colors.blue, fontWeightDelta: 2),
            );
          });
    } else if (currentUserId == '') {
      Text(
        "Loading",
        style: Theme.of(context)
            .textTheme
            .headline
            .apply(color: Colors.blue, fontWeightDelta: 2),
      );
    }
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Color(0xFFF17532),
      child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar: BottomBar(),
      backgroundColor: Color(0xff2446a6),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: MediaQuery.of(context).size.height / 3,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Color(0xff4169d8),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Color(0xff3a5fc8),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 70,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      "My Profile",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .apply(color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      'thumb (1).png',
                                      fit: BoxFit.cover,
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  name(context),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.menu,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: coins(context),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(25.0),
                              color: Colors.red,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "My next trip",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .apply(color: Colors.white),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "28",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .apply(color: Colors.white),
                                  ),
                                  Text(
                                    "Nov",
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .apply(color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Recommended",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .apply(color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: destinationsList.length,
                        itemBuilder: (ctx, i) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 11.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: Image.network(
                                        destinationsList[i].imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 9.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                "${destinationsList[i].placeName}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            Text(
                                              "${destinationsList[i].date}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle
                                                  .apply(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   height: 70,
            //   left: 0,
            //   right: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.all(11.0),
            //     child: MyBottomNavBar(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

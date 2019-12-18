import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:MoneyLotto/tabBar/tabBarNew.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Crypto Wallet',
      home: CryptoWallet(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CryptoWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // cryptoPortfolioItem() => Card(

    cryptoPortfolioItem(IconData icon, String name, double amount, double rate,
            String percentage) =>
        Card(
          elevation: 1.0,
          child: InkWell(
            onTap: () => print("tapped"),
            child: Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0, right: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Icon(icon, color: Colors.grey),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Text("\$$amount",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("$rate BTC",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal)),
                            Text("+ \$$percentage",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.red[500],
                                ))
                          ],
                        )
                      ],
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
        );
    return Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Color(0xFFF17532),
      child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF81269D),
                        const Color(0xFFEE112D)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      // stops: [0.0, 0.1],
                    ),
                  ),
                  height: 300,
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                                                      child: IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                         
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.bell,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                     
                      Text(
                        r"Account Details",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        r"Download History",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .75,
                  color: Colors.grey,
                )
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .25,
                  right: 10.0,
                  left: 10.0),
              child: new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    cryptoPortfolioItem(FontAwesomeIcons.btc, "BTC", 410.80,
                        0.0036, "82.19(92%)"),
                    cryptoPortfolioItem(FontAwesomeIcons.ethereum, "ETH",
                        1089.86, 126.0, "13.10(2.3%)"),
                    cryptoPortfolioItem(FontAwesomeIcons.xRay, "XRP", 22998.13,
                        23000, "120(3.6%)"),
                    cryptoPortfolioItem(FontAwesomeIcons.btc, "BTC", 410.80,
                        0.0036, "82.19(92%)"),
                    cryptoPortfolioItem(FontAwesomeIcons.ethereum, "ETH",
                        1089.86, 126.0, "13.10(2.3%)"),
                    cryptoPortfolioItem(FontAwesomeIcons.xRay, "XRP", 22998.13,
                        23000, "120(3.6%)"),
                    cryptoPortfolioItem(FontAwesomeIcons.btc, "BTC", 410.80,
                        0.0036, "82.19(92%)"),
                    cryptoPortfolioItem(FontAwesomeIcons.ethereum, "ETH",
                        1089.86, 126.0, "13.10(2.3%)"),
                    cryptoPortfolioItem(FontAwesomeIcons.xRay, "XRP", 22998.13,
                        23000, "120(3.6%)"),
                  ],
                ),
              ),
            ),
       
            
            
           
          ],
        ),
      ),
    );
  }
}
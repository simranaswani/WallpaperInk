import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:MoneyLotto/tabBar/tabBarNew.dart';
InterstitialAd _interstitialAd;
InterstitialAd createInterstitialAd() {
  return InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event $event");
    },
  );
}

/// Creates list of video players
class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final List<YoutubePlayerController> _controllers = [

  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  @override
  void initState() {
    _interstitialAd = createInterstitialAd()..load();
    _controllers.shuffle();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
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
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text('Dhanadhan Videos'),
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    _interstitialAd?.dispose();
                    _interstitialAd = createInterstitialAd()..load();
                  },
                  child: Container(
                    child: YoutubePlayer(
                      key: ObjectKey(_controllers[index]),
                      controller: _controllers[index],
                      actionsPadding: EdgeInsets.only(left: 16.0),
                      bottomActions: [
                        CurrentPosition(),
                        SizedBox(width: 10.0),
                        ProgressBar(isExpanded: true),
                        SizedBox(width: 10.0),
                        RemainingDuration(),
                        FullScreenButton(),
                      ],
                      onReady: () {
                        _interstitialAd?.show();
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: _controllers.length,
        separatorBuilder: (context, _) => SizedBox(height: 20.0),
      ),
    );
  }
}

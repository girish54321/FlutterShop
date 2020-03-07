import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_shoping/tradingView.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:page_transition/page_transition.dart';

import 'Animations/FadeAnimation.dart';
import 'MyNetworlImage.dart';
import 'banerView.dart';
import 'body.dart';
import 'modal/Baners.dart';
import 'network_utils/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShopingHome(),
    );
  }
}

class ShopingHome extends StatefulWidget {
  @override
  _ShopingHomeState createState() => _ShopingHomeState();
}

class _ShopingHomeState extends State<ShopingHome> {
  int _selectedItemPosition = 2;
  bool _isLoading = true;
  BanerResones banerResones;
  List<Baner> banerList;
  List<Widget> banerswidget = [];
  PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 2);
    _getBaners();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _getBaners() async {
    setState(() {
      _isLoading = true;
    });
    var res = await Network().getData('https://api.myjson.com/bins/82haw');
    var body = json.decode(res.body);
    print("BANERS PLZ========================================");
    print(res.statusCode);

    if (res.statusCode == 200) {
      banerResones = new BanerResones.fromJson(body);
      banerList = banerResones.baners;
      banerswidget = banerResones.baners.asMap().entries.map((MapEntry map) {
        return MyNetWorkImage(
          imageUrl: banerResones.baners[map.key].imageUrl,bluerCode: banerResones.baners[map.key].blurhash,
        );
      }).toList();
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

//  onPageChanged(int pageIndex) {
//    setState(() {
//      this._selectedItemPosition = pageIndex;
//    });
//  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,

    );
    setState(() {
      this._selectedItemPosition = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
              children: <Widget>[
                HomeBody(
                  text: "0",
                ),
                HomeBody(
                  text: "1",
                ),
                Home(),
                HomeBody(
                  text: "3",
                ),
                HomeBody(
                  text: "4",
                ),
              ],
              controller: pageController,
//        onPageChanged: onPageChanged,
              physics: NeverScrollableScrollPhysics(),
            ),
      bottomNavigationBar: SnakeNavigationBar(
        snakeColor: Colors.red,
        style: SnakeBarStyle.pinned,
        backgroundColor: Colors.white,
        currentIndex: _selectedItemPosition,
        onPositionChanged: onTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text('tickets')),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text('calendar')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.mic), title: Text('microphone')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('search'))
        ],
      ),
    );
  }

  Widget Home() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Stack(
            children: <Widget>[
              _isLoading
                  ? Text("")
                  : FadeAnimation(
                      1,
                      HomeBaners(
                        banerswidget: banerswidget,
                      ),
                    ),
              MyAppbar(),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text("Trinding Cloths"),
                Container(
                  height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: banerList.length,
                      itemBuilder: (context, index) {
                        Baner b = banerList[index];
                        return TrandingView(
                          image: b.imageUrl,bluerCode: b.blurhash,
                        );
                      }),
                ),
                Text("Trinding Cloths"),
                Container(
                  height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: banerList.length,
                      itemBuilder: (context, index) {
                        Baner b = banerList[index];
                        return TrandingView(
                          image: b.imageUrl,bluerCode: b.blurhash,
                        );
                      }),
                ),
              ],
            ),
//            child:  TrandingView(),
          ),
        ),
      ],
    );
  }
}

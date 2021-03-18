import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
  videoPlayerController.initialize();
}

final videoPlayerController = VideoPlayerController.network(
    "http://fykmobile-p.mncdn.com/egitlence/0LNAOCWCqdQ.mp4");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Neo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  bool continious = false;
  bool notStarted = false;
  bool completed = false;
  List cards = [
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 25,
      'time': '1 sa 30 dk'
    },
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk'
    },
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk'
    },
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk'
    }
  ];

  selectType() {}

  setTabIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset(
              "images/logo.png",
            ),
          ),
          title: Text(
            "Neo",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  child: Column(
                    children: [
                      DefaultTabController(
                          length: 3,
                          child: Container(
                            child: TabBar(
                              onTap: setTabIndex,
                              labelColor: Colors.black,
                              indicatorColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: [
                                Tab(text: "Eğitimlerim"),
                                Tab(text: "Önerilenler"),
                                Tab(text: "Katalog")
                              ],
                            ),
                          )),
                      if (_selectedIndex == 0)
                        Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Container(
                                      child: Row(
                                        children: [
                                          ButtonTheme(
                                            height: 40,
                                            child: RaisedButton(
                                              color: Colors.white,
                                              splashColor: Colors.blue,
                                              shape: RoundedRectangleBorder(
                                                  side: BorderSide(color: HexColor("#7478FB")),
                                                  borderRadius: BorderRadius.circular(5)),
                                              onPressed: selectType,
                                              textColor: HexColor("#7478FB"),
                                              child: Text("Hedef Tarih Yakın"),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: ButtonTheme(
                                                height: 40,
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  splashColor: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: HexColor("#7478FB")),
                                                      borderRadius: BorderRadius.circular(5)),
                                                  onPressed: selectType,
                                                  textColor: HexColor("#7478FB"),
                                                  child: Text("Kendi Seçtiklerim"),
                                                ),
                                              ))
                                        ],
                                      )),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(5.0)),
                                                        borderSide: BorderSide(
                                                            color: Colors.white)),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(5.0)),
                                                        borderSide: BorderSide(
                                                            color: Colors.white)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(5.0)),
                                                        borderSide: BorderSide(
                                                            color: Colors.white)),
                                                    filled: true,
                                                    prefixIcon: Icon(
                                                      Icons.search,
                                                      color: Colors.grey,
                                                    ),
                                                    fillColor: Colors.white,
                                                    hintText: "Eğitimlerim için ara.."),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Card(
                                                  elevation: 5,
                                                  child: ClipPath(
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              left: BorderSide(
                                                                  color:
                                                                  HexColor("#FED94A"),
                                                                  width: 50))),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 20),
                                                            child: Text(
                                                              "Devam Edenler - 12",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                continious = !continious;
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: 20),
                                                              child: Text(
                                                                continious == true
                                                                    ? "Gizle"
                                                                    : "Tümünü Göster",
                                                                style: TextStyle(
                                                                    color: Colors.grey),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    clipper: ShapeBorderClipper(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(3))),
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                  height: continious == false ? 0 : 250,
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(milliseconds: 500),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        for (var i in cards)
                                                          Flexible(
                                                            child: Card(
                                                              elevation: 5,
                                                              child: SingleChildScrollView(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      height: 150,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        image:
                                                                        DecorationImage(
                                                                          fit: BoxFit.cover,
                                                                          //I assumed you want to occupy the entire space of the card
                                                                          image: AssetImage(
                                                                            'images/card1.png',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      child: ListTile(),
                                                                    ),
                                                                    Text(i['explanation'])
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Card(
                                                  elevation: 5,
                                                  child: ClipPath(
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              left: BorderSide(
                                                                  color:
                                                                  HexColor("#BEBEBE"),
                                                                  width: 50))),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 20),
                                                            child: Text(
                                                              "Başlamadıklarım - 12",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                notStarted = !notStarted;
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: 20),
                                                              child: Text(
                                                                notStarted == true
                                                                    ? "Gizle"
                                                                    : "Tümünü Göster",
                                                                style: TextStyle(
                                                                    color: Colors.grey),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    clipper: ShapeBorderClipper(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(3))),
                                                  ),
                                                ),
                                                if (notStarted == true)
                                                  Row(
                                                    children: [
                                                      for (var i in cards) Text("asd")
                                                    ],
                                                  )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Card(
                                                  elevation: 5,
                                                  child: ClipPath(
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              left: BorderSide(
                                                                  color:
                                                                  HexColor("#97BA4C"),
                                                                  width: 50))),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 20),
                                                            child: Text(
                                                              "Tamamladıklarım - 22",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                completed = !completed;
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: 20),
                                                              child: Text(
                                                                completed == true
                                                                    ? "Gizle"
                                                                    : "Tümünü Göster",
                                                                style: TextStyle(
                                                                    color: Colors.grey),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    clipper: ShapeBorderClipper(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(3))),
                                                  ),
                                                ),
                                                if (completed == true)
                                                  Row(
                                                    children: [
                                                      for (var i in cards) Text("asd")
                                                    ],
                                                  )
                                              ],
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            )),
                      if (_selectedIndex == 1)
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("Önerilenler"),
                              )
                            ],
                          ),
                        )
                    ],
                  )),
            )
          ],
        ));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  int selectedView = 0;
  int _selectedIndex = 0;
  bool continious = false;
  bool notStarted = false;
  bool completed = false;
  List cards = [
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 25,
      'time': '1 sa 30 dk',
      'count': '12'
    },
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12'
    },
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12'
    },
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12'
    },
    {
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12'
    },
  ];

  selectType() {}

  setTabIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget getSelectedView() {
    if (selectedView == 0) {
      return Column(
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
                                  color: Color(0xffFED94A), width: 50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Devam Edenler - 12",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                continious = continious != true;
                              });
                            },
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                continious == true ? "Gizle" : "Tümünü Göster",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                  ),
                ),
                AnimatedContainer(
                  height: continious == false
                      ? 0
                      : MediaQuery.of(context).size.height,
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [for (var card in cards) myCards(card)],
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
                                  color: Color(0xffBEBEBE), width: 50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Başlamadıklarım - 12",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                notStarted = notStarted != true;
                              });
                            },
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                notStarted == true ? "Gizle" : "Tümünü Göster",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                  ),
                ),
                if (notStarted == true)
                  Row(
                    children: [for (var i in cards) Text("asd")],
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
                                  color: Color(0xff97BA4C), width: 50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Tamamladıklarım - 22",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                completed = completed != true;
                              });
                            },
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                completed == true ? "Gizle" : "Tümünü Göster",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                  ),
                ),
                if (completed == true)
                  Row(
                    children: [for (var i in cards) Text("asd")],
                  ),
              ],
            ),
          )
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          for (var card in cards)
            Column(
              children: [
                Card(
                  elevation: 5,
                  child: ClipPath(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Color(0xffFED94A), width: 5))),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dolum Hattında İş Güvenliği Ve Risk Durumları",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Kategori/Alt Kategori",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          VerticalDivider(
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15, bottom: 15, left: 50, right: 50),
                            child: Column(
                              children: [
                                Text(
                                  "12.03.2021",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "90 Gün Kaldı",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          VerticalDivider(
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              children: [
                                Text(
                                  "Devam Ediyor",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10, right: 40),
                              child: CircularPercentIndicator(
                                radius: 45.0,
                                lineWidth: 4.0,
                                percent: 0.90,
                                center: new Text(
                                  "%90",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                progressColor: Colors.green,
                              )),
                        ],
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                  ),
                ),
              ],
            )
        ],
      );
    }
  }

  Widget myCards(card) {
    return Container(
      child: Card(
          elevation: 5,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'images/card1.png',
                        ),
                      ),
                    ),
                    child: ListTile(),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xffE04646)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xffE04646)),
                                    borderRadius: BorderRadius.circular(5)))),
                        child: Text(
                          "Son 2 Gün",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 20,
                      child: Container(
                        child: SizedBox(
                          width: 40,
                          child: MouseRegion(
                            onHover: (event) {},
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff7478FB)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xff7478FB)),
                                            borderRadius:
                                                BorderRadius.circular(5)))),
                                child: Icon(
                                  Icons.add_to_photos_sharp,
                                  size: 15,
                                )),
                          ),
                        ),
                      )),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 5),
                child: Text(
                  card['explanation'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
                child: new LinearPercentIndicator(
                  lineHeight: 10.0,
                  percent: card['progress'] / 100,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  backgroundColor: Color(0xffE8E8E8),
                  progressColor: Colors.blue,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tamamlandı: %" + card['progress'].toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      card['time'],
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      card['count'],
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset(
              "assets/images/logo.png",
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
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Color(0xff7478FB)),
                                              borderRadius:
                                                  BorderRadius.circular(5)))),
                                  onPressed: selectType,
                                  child: Text("Hedef Tarih Yakın",
                                      style:
                                          TextStyle(color: Color(0xff7478FB))),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: ButtonTheme(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Color(0xff7478FB)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5)))),
                                      onPressed: selectType,
                                      child: Text("Kendi Seçtiklerim",
                                          style: TextStyle(
                                              color: Color(0xff7478FB))),
                                    ),
                                  )),
                              Spacer(),
                              Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: ButtonTheme(
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    selectedView == 0
                                                        ? Color(0xff7478FB)
                                                        : Colors.transparent),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xff7478FB)),
                                                    borderRadius:
                                                        BorderRadius.circular(5)))),
                                        onPressed: () {
                                          setState(() {
                                            selectedView = 0;
                                          });
                                        },
                                        child: Icon(Icons.apps)),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: ButtonTheme(
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    selectedView == 1
                                                        ? Color(0xff7478FB)
                                                        : Colors.transparent),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xff7478FB)),
                                                    borderRadius:
                                                        BorderRadius.circular(5)))),
                                        onPressed: () {
                                          setState(() {
                                            selectedView = 1;
                                          });
                                        },
                                        child: Icon(Icons.list)),
                                  )),
                            ],
                          )),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
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
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: getSelectedView()),
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
                          ),
                        ],
                      ),
                    ),
                ],
              )),
            )
          ],
        ));
  }
}

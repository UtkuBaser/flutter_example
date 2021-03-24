import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

final videoPlayerController = VideoPlayerController.network(
    "http://fykmobile-p.mncdn.com/egitlence/0LNAOCWCqdQ.mp4");

final List<String> imgList = [
  "assets/images/img_ads.png",
];

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int active = 0;
  bool _extend = false;
  int selectedMenu = 0;
  int _counter = 0;
  int selectedView = 0;
  int _selectedIndex = 0;
  bool continious = false;
  bool notStarted = false;
  bool completed = false;
  List cards = [
    {
      'id': 1,
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 25,
      'time': '1 sa 30 dk',
      'count': '12',
      'category': ["Bireysel Mükemmellik", "Teknik Eğitimler"],
      'hover': false
    },
    {
      'id': 2,
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12',
      'category': ["Bireysel Mükemmellik", "Teknik Eğitimler"],
      'hover': false
    },
    {
      'id': 3,
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12',
      'category': ["Bireysel Mükemmellik", "Teknik Eğitimler"],
      'hover': false
    },
    {
      'id': 4,
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12',
      'category': [],
      'hover': false
    },
    {
      'id': 5,
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12',
      'category': ["Bireysel Mükemmellik", "Teknik Eğitimler"],
      'hover': false
    },
    {
      'id': 6,
      'explanation': "Operasyonel Mükemmellik Serisi: Toplam Üretken Bakım",
      'progress': 75,
      'time': '1 sa 30 dk',
      'count': '12',
      'category': [],
      'hover': false
    },
  ];
  int _currentSliderTab = 0;

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(
                          "Gelişim Şimdi Başlıyor!",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 80, left: 30, right: 30),
                        child: Text(
                          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem.",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 20,
                        child: SizedBox(
                          width: 250,
                          height: 35,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff6267F4)),
                            ),
                            onPressed: () {
                              print("asd");
                            },
                            child: Text("GELİŞİM FIRSATLARINI KEŞFET",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

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

  Widget getCardsCategory(category) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xff97BA4C)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff97BA4C)),
                    borderRadius: BorderRadius.circular(5)))),
        child: Text(category),
      ),
    );
  }

  Widget myCards(card) {
    return SizedBox(
      child: Card(
          elevation: 5,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'images/card1.png',
                        ),
                      ),
                    ),
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
                  AnimatedPositioned(
                    curve: Curves.decelerate,
                    child:  MouseRegion(
                      onHover: (event) {
                        setState(() {
                          for (var item in cards) {
                            if (item['id'] == card['id']) {
                              item['hover'] = true;
                            }
                          }
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          for (var item in cards) {
                            if (item['id'] == card['id']) {
                              item['hover'] = false;
                            }
                          }
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var category in card['category'])
                            (card['category'].length > 0
                                ? getCardsCategory(category)
                                : [])
                        ],
                      ),
                    ),
                    duration: Duration(milliseconds: 300),
                    bottom: card['hover'] == false ? -100 : 50,
                    left: 20,
                  ),
                  Positioned(
                      bottom: 10,
                      left: 20,
                      child: Container(
                        child: SizedBox(
                          width: 40,
                          child: MouseRegion(
                            onHover: (event) {
                              setState(() {
                                for (var item in cards) {
                                  if (item['id'] == card['id']) {
                                    item['hover'] = true;
                                  }
                                }
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                for (var item in cards) {
                                  if (item['id'] == card['id']) {
                                    item['hover'] = false;
                                  }
                                }
                              });
                            },
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
                child: LinearPercentIndicator(
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
        body: Stack(
          children: [
            Row(
              children: [
                NavigationRail(
                  extended: _extend,
                  elevation: 5,
                  selectedIndex: selectedMenu,
                  onDestinationSelected: (int index) {
                    setState(() {
                      selectedMenu = index;
                    });
                  },
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('First'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.wb_incandescent_outlined),
                      selectedIcon: Icon(Icons.wb_incandescent),
                      label: Text('Second'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.star_border),
                      selectedIcon: Icon(Icons.star),
                      label: Text('Third'),
                    ),
                  ],
                ),
                if (selectedMenu == 0)
                  Flexible(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff7276F7),
                                                  offset: Offset(0.0, 1.0),
                                                  blurRadius: 10.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  'images/welcome.png',
                                                ),
                                              ),
                                            ),
                                            height: 150,
                                            width: double.infinity,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Hoşgeldin Alev Yıldız",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    "Neo Akademi ile kendini geliştirmeye başla.",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 15,
                                            right: 20,
                                            child: SizedBox(
                                              width: 100,
                                              height: 35,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                ),
                                                onPressed: () {
                                                  print("asd");
                                                },
                                                child: Text("BAŞLA",
                                                    style: TextStyle(
                                                        color: Colors.black)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Stack(
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                        blurRadius: 10.0,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                height: 150,
                                                width: double.infinity,
                                                child: Flex(
                                                  direction: Axis.horizontal,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  left: 15),
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Kazanımlarım",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            17),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                10),
                                                                    child: Image
                                                                        .asset(
                                                                      "/images/ic_rozet.png",
                                                                      height:
                                                                          100,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 30,
                                                                        left:
                                                                            10),
                                                                    child: Text(
                                                                      "Hoşgeldin Rozeti",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 15,
                                                                        left:
                                                                            10),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          400,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                              maxWidth: 400),
                                                                      child:
                                                                          Text(
                                                                        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                            maxWidth:
                                                                                350),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 5),
                                                                      child:
                                                                          LinearPercentIndicator(
                                                                        trailing: Text(
                                                                            "1/10",
                                                                            style:
                                                                                TextStyle(color: Colors.grey)),
                                                                        lineHeight:
                                                                            6.0,
                                                                        percent:
                                                                            0.2,
                                                                        linearStrokeCap:
                                                                            LinearStrokeCap.roundAll,
                                                                        backgroundColor:
                                                                            Color(0xffE8E8E8),
                                                                        progressColor:
                                                                            Colors.blue,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )),
                                                    ),
                                                  ],
                                                )),
                                            Positioned(
                                              bottom: 15,
                                              right: 20,
                                              child: SizedBox(
                                                width: 100,
                                                height: 35,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Color(
                                                                0xff21C8D9)),
                                                  ),
                                                  onPressed: () {
                                                    print("asd");
                                                  },
                                                  child: Text("GÖZAT",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 25),
                                      child: CarouselSlider(
                                        items: imageSliders,
                                        options: CarouselOptions(
                                            autoPlay: true,
                                            height: 330,
                                            enlargeCenterPage: false,
                                            viewportFraction: 1,
                                            aspectRatio: 2.0,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                _currentSliderTab = index;
                                              });
                                            }),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: imgList.map((url) {
                                        int index = imgList.indexOf(url);
                                        return Container(
                                          width: 8.0,
                                          height: 8.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _currentSliderTab == index
                                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                                : Color.fromRGBO(0, 0, 0, 0.4),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Eğitim Kategorileri",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            height: 100.0,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                for (var card in cards)
                                  Container(
                                    width: 355,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: SizedBox(
                                        child: Card(
                                          elevation: 5,
                                          child: ClipPath(
                                            child: Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      left: BorderSide(
                                                          color:
                                                              Color(0xffFED94A),
                                                          width: 5))),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Liderlik Yöneticilik",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              "+4 Alt Kategori",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            clipper: ShapeBorderClipper(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 30, top: 15, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Senin İçin Önerilenler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                "Tümünü Gör",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (selectedMenu == 1)
                  Flexible(
                      child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 450,
                                child: DefaultTabController(
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:20,right: 20,bottom:20),
                        child: Container(
                          child:
                            Column(
                              children: [
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
                                                        MaterialStateProperty.all<
                                                            Color>(Colors.white),
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xff7478FB)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5)))),
                                                onPressed: selectType,
                                                child: Text("Hedef Tarih Yakın",
                                                    style: TextStyle(
                                                        color: Color(0xff7478FB))),
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(left: 10),
                                                child: ButtonTheme(
                                                  height: 40,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors.white),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Color(
                                                                        0xff7478FB)),
                                                                borderRadius:
                                                                    BorderRadius.circular(5)))),
                                                    onPressed: selectType,
                                                    child: Text("Kendi Seçtiklerim",
                                                        style: TextStyle(
                                                            color:
                                                                Color(0xff7478FB))),
                                                  ),
                                                )),
                                            Spacer(),
                                            Padding(
                                                padding: EdgeInsets.only(right: 10),
                                                child: ButtonTheme(
                                                  height: 40,
                                                  child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all<
                                                              Color>(selectedView ==
                                                                  0
                                                              ? Color(0xff7478FB)
                                                              : Colors.transparent),
                                                          shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      color: Color(
                                                                          0xff7478FB)),
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
                                                          backgroundColor: MaterialStateProperty.all<
                                                              Color>(selectedView ==
                                                                  1
                                                              ? Color(0xff7478FB)
                                                              : Colors.transparent),
                                                          shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      color: Color(
                                                                          0xff7478FB)),
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.only(top: 10),
                                                    child: TextField(
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                      decoration: InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          5.0)),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          5.0)),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(Radius.circular(5.0)),
                                                              borderSide: BorderSide(color: Colors.white)),
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
                            ),
                        ),
                      )
                    ],
                  )),
              ],
            ),
            AnimatedPositioned(
              curve: Curves.easeOutQuart,
              child: SizedBox(
                width: 30,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _extend = _extend != true;
                    });
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(Size(5, 15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))))),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              duration: Duration(milliseconds: 400),
              top: 15,
              left: (_extend == false ? 72 : 257),
            )
          ],
        ));
  }
}

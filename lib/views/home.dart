import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app_for_web/views/myAppBar.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
  ScrollController _scrollController = new ScrollController();

  final List<String> imgList = [
    "assets/images/img_ads.png",
  ];

  @override
  Widget build(BuildContext context) {
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
    double screenWidth = MediaQuery.of(context).size.width - 72;
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenWidth > 1600
                ? (screenWidth - 1450) / 2
                : screenWidth * 0.05,
            child: Column(
              children: [],
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 1450),
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                children: [
                  Flexible(
                    child: ListView(
                      children: [
                        Column(
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
                                                      color: Color(
                                                          0xff7276F7),
                                                      offset: Offset(
                                                          0.0, 1.0),
                                                      blurRadius: 10.0,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(10),
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
                                                padding:
                                                EdgeInsets.all(15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Hoşgeldin Alev Yıldız",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize: 30),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                          top: 15),
                                                      child: Text(
                                                        "Neo Akademi ile kendini geliştirmeye başla.",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
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
                                                      MaterialStateProperty
                                                          .all<Color>(
                                                          Colors
                                                              .white),
                                                    ),
                                                    onPressed: () {
                                                      print("asd");
                                                    },
                                                    child: Text("BAŞLA",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black)),
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
                                                            color: Colors
                                                                .grey,
                                                            offset:
                                                            Offset(
                                                                0.0,
                                                                1.0),
                                                            blurRadius:
                                                            10.0,
                                                          ),
                                                        ],
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10),
                                                        color:
                                                        Colors.white),
                                                    height: 150,
                                                    width:
                                                    double.infinity,
                                                    child: Flex(
                                                      direction:
                                                      Axis.horizontal,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: 10,
                                                                  left:
                                                                  15),
                                                              child: Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        "Kazanımlarım",
                                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(top: 10),
                                                                        child: Image.asset(
                                                                          "/images/ic_rozet.png",
                                                                          height: 100,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.only(top: 30, left: 10),
                                                                        child: Text(
                                                                          "Hoşgeldin Rozeti",
                                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(top: 15, left: 10),
                                                                        child: Container(
                                                                          width: 400,
                                                                          constraints: BoxConstraints(maxWidth: 400),
                                                                          child: Text(
                                                                            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque",
                                                                            style: TextStyle(fontSize: 15, color: Colors.grey),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        constraints: BoxConstraints(maxWidth: 350),
                                                                        child: Padding(
                                                                          padding: EdgeInsets.only(top: 5),
                                                                          child: LinearPercentIndicator(
                                                                            trailing: Text("1/10", style: TextStyle(color: Colors.grey)),
                                                                            lineHeight: 6.0,
                                                                            percent: 0.2,
                                                                            linearStrokeCap: LinearStrokeCap.roundAll,
                                                                            backgroundColor: Color(0xffE8E8E8),
                                                                            progressColor: Colors.blue,
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
                                                        MaterialStateProperty.all<
                                                            Color>(
                                                            Color(
                                                                0xff21C8D9)),
                                                      ),
                                                      onPressed: () {
                                                        print("asd");
                                                      },
                                                      child: Text("GÖZAT",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
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
                                          padding:
                                          EdgeInsets.only(top: 25),
                                          child: CarouselSlider(
                                            items: imageSliders,
                                            options: CarouselOptions(
                                                autoPlay: true,
                                                height: 330,
                                                enlargeCenterPage: false,
                                                viewportFraction: 1,
                                                aspectRatio: 2.0,
                                                onPageChanged:
                                                    (index, reason) {
                                                  setState(() {
                                                    _currentSliderTab =
                                                        index;
                                                  });
                                                }),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: imgList.map((url) {
                                            int index =
                                            imgList.indexOf(url);
                                            return Container(
                                              width: 8.0,
                                              height: 8.0,
                                              margin:
                                              EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 2.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                _currentSliderTab ==
                                                    index
                                                    ? Color.fromRGBO(
                                                    0, 0, 0, 0.9)
                                                    : Color.fromRGBO(
                                                    0, 0, 0, 0.4),
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                height: 100.0,
                                child: Stack(
                                  children: [
                                    ListView(
                                      controller: _scrollController,
                                      shrinkWrap: true,
                                      reverse: false,
                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[
                                        for (var card in cards)
                                          Container(
                                            width: 318,
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
                                                                  color: Color(
                                                                      0xffFED94A),
                                                                  width:
                                                                  5))),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            EdgeInsets
                                                                .all(
                                                                15),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  "Liderlik Yöneticilik",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child:
                                                                  Align(
                                                                    alignment:
                                                                    Alignment.topLeft,
                                                                    child:
                                                                    Text(
                                                                      "+4 Alt Kategori",
                                                                      style:
                                                                      TextStyle(color: Colors.grey),
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
                                                            BorderRadius
                                                                .circular(
                                                                3))),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Positioned(
                                        top: 30,
                                        left: 5,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          child: FloatingActionButton(
                                            heroTag: "prev",
                                            onPressed: () {
                                              _scrollController.animateTo(
                                                _scrollController
                                                    .position.pixels -
                                                    250,
                                                curve: Curves.easeOut,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                              );
                                            },
                                            backgroundColor:
                                            Colors.transparent,
                                            child: Icon(
                                                Icons
                                                    .arrow_back_ios_outlined,
                                                color: Colors.white),
                                          ),
                                        )),
                                    Positioned(
                                        top: 30,
                                        right: 5,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          child: FloatingActionButton(
                                            child: Icon(
                                                Icons
                                                    .arrow_forward_ios_rounded,
                                                color: Colors.white),
                                            backgroundColor:
                                            Colors.transparent,
                                            heroTag: "next",
                                            onPressed: () {
                                              _scrollController.animateTo(
                                                _scrollController
                                                    .position.pixels +
                                                    250,
                                                curve: Curves.easeOut,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                              );
                                            },
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 30, top: 15, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Senin İçin Önerilenler",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Tümünü Gör",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: screenWidth > 1600
                ? (screenWidth - 1450) / 2
                : screenWidth * 0.05,
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
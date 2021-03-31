import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_app_for_web/views/myAppBar.dart';

class Education extends StatefulWidget {
  static const routeName = '/education';
  Education({Key key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  int selectedView = 0;
  bool continuous = false;
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
  ScrollController _scrollController = new ScrollController();

  setTabIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  selectType() {}

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
                  height: 160,
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side:
                                          BorderSide(color: Color(0xffE04646)),
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
              padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 5),
              child: Text(
                card['explanation'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 5),
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
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
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
        ),
      ),
    );
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
                                continuous = continuous != true;
                              });
                            },
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                continuous == true ? "Gizle" : "Tümünü Göster",
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
                  height: continuous == false
                      ? 0
                      : MediaQuery.of(context).size.height - 60,
                  curve: Curves.fastOutSlowIn,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  duration: Duration(milliseconds: 500),
                  child: GridView.count(
                    childAspectRatio: 0.85,
                    crossAxisCount: 4,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                    children: [for (var card in cards) myCards(card)],
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
          ),
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
                                ),
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
                                ),
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
            ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            child: Column(
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Container(
                            child: Column(
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
                                                    child: Text(
                                                        "Hedef Tarih Yakın",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff7478FB))),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                    EdgeInsets.only(left: 10),
                                                    child: ButtonTheme(
                                                      height: 40,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                            MaterialStateProperty.all<
                                                                Color>(
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
                                                        child: Text(
                                                            "Kendi Seçtiklerim",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff7478FB))),
                                                      ),
                                                    )),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(right: 10),
                                                  child: ButtonTheme(
                                                    height: 40,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                            MaterialStateProperty.all<Color>(
                                                                selectedView == 0
                                                                    ? Color(
                                                                    0xff7478FB)
                                                                    : Colors
                                                                    .transparent),
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
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(right: 10),
                                                  child: ButtonTheme(
                                                    height: 40,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                            MaterialStateProperty.all<Color>(
                                                                selectedView == 1
                                                                    ? Color(
                                                                    0xff7478FB)
                                                                    : Colors
                                                                    .transparent),
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.4,
                                                  child: Container(
                                                    height: 40,
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
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 20),
                                              child: getSelectedView()),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                if (_selectedIndex == 2)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Card(
                                              elevation: 5,
                                              child: ClipPath(
                                                child: Container(
                                                  height: 350,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.all(20),
                                                          child: Text(
                                                              "Neo Dünyasını Keşfet!",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 18))),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 0,
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 10),
                                                        child: Text(
                                                          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo..",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0xff606060)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 40,
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 10),
                                                        child: Container(
                                                          height: 100,
                                                          child: Stack(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    right: 40,
                                                                    left: 40),
                                                                child: ListView(
                                                                  controller:
                                                                  _scrollController,
                                                                  shrinkWrap:
                                                                  true,
                                                                  reverse: false,
                                                                  scrollDirection:
                                                                  Axis.horizontal,
                                                                  children: <
                                                                      Widget>[
                                                                    for (var card
                                                                    in cards)
                                                                      Container(
                                                                        width:
                                                                        230,
                                                                        child:
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsets.all(10),
                                                                          child:
                                                                          SizedBox(
                                                                            child:
                                                                            Card(
                                                                              shape:
                                                                              RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                              elevation:
                                                                              5,
                                                                              child:
                                                                              ClipPath(
                                                                                child: Container(
                                                                                  height: 70,
                                                                                  color: card['id'] == 1 ? Color(0xff97BA4C) : Colors.white,
                                                                                  child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(15),
                                                                                      child: Container(
                                                                                          width: 120,
                                                                                          child: Text(
                                                                                            "Bireysel Mükemmellik",
                                                                                            style: TextStyle(color: card['id'] == 1 ? Colors.white : Colors.black, fontSize: 18),
                                                                                            textAlign: TextAlign.center,
                                                                                          )),
                                                                                    ),
                                                                                  ]),
                                                                                ),
                                                                                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Positioned(
                                                                  top: 30,
                                                                  left: 5,
                                                                  child:
                                                                  Container(
                                                                    width: 40,
                                                                    height: 40,
                                                                    child:
                                                                    FloatingActionButton(
                                                                      heroTag:
                                                                      "prev",
                                                                      onPressed:
                                                                          () {
                                                                        _scrollController
                                                                            .animateTo(
                                                                          _scrollController.position.pixels -
                                                                              250,
                                                                          curve: Curves
                                                                              .easeOut,
                                                                          duration:
                                                                          const Duration(milliseconds: 500),
                                                                        );
                                                                      },
                                                                      backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                      child: Icon(
                                                                          Icons
                                                                              .arrow_back_ios_outlined,
                                                                          color: Colors
                                                                              .white),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                top: 30,
                                                                right: 5,
                                                                child: Container(
                                                                  width: 40,
                                                                  height: 40,
                                                                  child:
                                                                  FloatingActionButton(
                                                                    child: Icon(
                                                                        Icons
                                                                            .arrow_forward_ios_rounded,
                                                                        color: Colors
                                                                            .white),
                                                                    backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                    heroTag:
                                                                    "next",
                                                                    onPressed:
                                                                        () {
                                                                      _scrollController
                                                                          .animateTo(
                                                                        _scrollController
                                                                            .position
                                                                            .pixels +
                                                                            250,
                                                                        curve: Curves
                                                                            .easeOut,
                                                                        duration: const Duration(
                                                                            milliseconds:
                                                                            500),
                                                                      );
                                                                    },
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
                                                clipper: ShapeBorderClipper(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(3),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
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

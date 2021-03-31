import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_web/views/education.dart';
import 'package:flutter_app_for_web/views/home.dart';
import 'package:flutter_app_for_web/views/report.dart';
import 'package:flutter_app_for_web/views/myAppBar.dart';

void main() {
  runApp(MyApp());
}

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
      initialRoute: "/",
      routes: {
        Dashboard.routeName: (context) => Dashboard(),
        Education.routeName: (context) => Education(),
        Report.routeName: (context) => Report(),
      },
      debugShowCheckedModeBanner: false,
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

  final _navigatorKey = GlobalKey<NavigatorState>();


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

  Future<void> push(Route route) {
    return _navigatorKey.currentState.push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Row(
        children: [
          NavigationRail(
            extended: _extend,
            elevation: 5,
            selectedIndex: selectedMenu,
            onDestinationSelected: (int index) {
              setState(() {
                selectedMenu = index;
                if (index == 0) {
                  push(MaterialPageRoute(builder: (context) => Dashboard()));
                } else if (index == 1) {
                  push(MaterialPageRoute(builder: (context) => Education()));
                } else if (index == 2) {
                  push(MaterialPageRoute(builder: (context) => Report()));
                }
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
          Expanded(
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => Dashboard(),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

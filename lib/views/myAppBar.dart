import 'dart:ui';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(55);
  _MyAppBarState createState() => _MyAppBarState();
}

Widget myPopMenu() {
  return PopupMenuButton(
      onSelected: (value) {
        print("selected menu");
      },
      icon: Icon(
        Icons.arrow_drop_down,
        color: Color(0xff7478FB),
        size: 30,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(Icons.person_rounded,
                      color: Color(0xff7478FB)),
                ),
                Text('Profil')
              ],
            )),
        PopupMenuItem(
            value: 2,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(Icons.settings, color: Color(0xff7478FB)),
                ),
                Text('Ayarlar')
              ],
            )),
      ]);
}

class _MyAppBarState extends State<MyAppBar> {
  String _selectedDropdownItem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 40, top: 8, bottom: 8),
          child: Container(
            width: 150,
            height: 10,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff7478FB),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  hint: Text(
                    "Keşfet",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  value: _selectedDropdownItem,
                  items: <String>["1", "2", "3", "4"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedDropdownItem = value;
                  }),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(right: 20, top: 0),
            child: Icon(
              Icons.av_timer_outlined,
              size: 30,
              color: Color(0xff7478FB),
            )),
        Padding(
          padding: EdgeInsets.only(right: 25, top: 12),
          child: Stack(
            children: <Widget>[
              new Icon(
                Icons.notifications_none,
                color: Color(0xff7478FB),
                size: 30,
              ),
              new Positioned(
                right: 0,
                child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 13,
                      minHeight: 13,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.5),
                      child: new Text(
                        '10',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(right: 10, top: 0),
            child: CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage('images/img_ads.png'),
              backgroundColor: Colors.transparent,
            )),
        Padding(
            padding: EdgeInsets.only(right: 0, top: 20),
            child: Text(
              "Alev Yıldız",
              style: TextStyle(color: Colors.black),
            )),
        Padding(padding: EdgeInsets.only(right: 80), child: myPopMenu())
      ],
    );
  }
}

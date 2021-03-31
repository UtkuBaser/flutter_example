import 'dart:ui';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  static const routeName = '/report';
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
                children: [],
              ) ,
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

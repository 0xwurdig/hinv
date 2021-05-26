import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinv/size_config.dart';

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

Widget fraction(int a, int b, int dcolor, double fontSize) {
  return (Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(a.toString(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: a < b * 0.8 ? Color(0xFFB52929) : Color(0xFF29B540),
              fontSize: fontSize,
              fontWeight: FontWeight.w600)),
      SizedBox(height: getHeight(6))
    ]),
    Text('/',
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(dcolor),
            fontSize: fontSize,
            fontWeight: FontWeight.w600)),
    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(height: 6),
      Text(b.toString(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color(dcolor),
              fontSize: fontSize,
              fontWeight: FontWeight.w600)),
    ]),
  ]));
}

Widget efraction(int a, int b, int dcolor, double fontSize) {
  return (Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(a.toString(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: a < b * 0.8 ? Color(0xFFB52929) : Color(0xFF29B540),
              fontSize: fontSize,
              fontWeight: FontWeight.w600)),
      SizedBox(height: getHeight(6))
    ]),
    Text('/',
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(dcolor),
            fontSize: fontSize,
            fontWeight: FontWeight.w600)),
    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(height: 6),
      Container(
          padding: EdgeInsets.only(top: getHeight(10)),
          height: 40,
          child: IntrinsicWidth(
            child: TextFormField(
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(dcolor),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: b.toString(),
                  hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Color(dcolor),
                    fontSize: fontSize,
                  )),
            ),
          ))

      // Text(b.toString(),
      //     overflow: TextOverflow.ellipsis,
      //     textAlign: TextAlign.start,
      //     style: TextStyle(
      //         fontFamily: 'Montserrat',
      //         color: Color(dcolor),
      //         fontSize: fontSize,
      //         fontWeight: FontWeight.w600)),
    ]),
  ]));
}

Widget newItemFraction(int dcolor, double fontSize) {
  TextEditingController a = new TextEditingController();
  TextEditingController b = new TextEditingController();
  return (Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          padding: EdgeInsets.only(bottom: getHeight(10)),
          height: 40,
          child: IntrinsicWidth(
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: a,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.amber[700],
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "0",
                  hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Colors.amber[700],
                    fontSize: fontSize,
                  )),
            ),
          )),
      SizedBox(height: getHeight(6))
    ]),
    Text('/',
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(dcolor),
            fontSize: fontSize,
            fontWeight: FontWeight.w600)),
    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(height: 6),
      Container(
          padding: EdgeInsets.only(top: getHeight(10)),
          height: 40,
          child: IntrinsicWidth(
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: b,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(dcolor),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "0",
                  hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Color(dcolor),
                    fontSize: fontSize,
                  )),
            ),
          ))

      // Text(b.toString(),
      //     overflow: TextOverflow.ellipsis,
      //     textAlign: TextAlign.start,
      //     style: TextStyle(
      //         fontFamily: 'Montserrat',
      //         color: Color(dcolor),
      //         fontSize: fontSize,
      //         fontWeight: FontWeight.w600)),
    ]),
  ]));
}

String getInitials(name) {
  List<String> names = name.split(" ");
  String initials = "";
  int numWords = 2;

  if (numWords < names.length) {
    numWords = names.length;
  }
  for (var i = 0; i < numWords; i++) {
    initials += '${names[i][0]}';
  }
  return initials;
}

Widget cfraction(int a, int b, int dcolor, double fontSize, int c) {
  return Container(
    width: getWidth(150),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: (Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          RichText(
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: a.toString(),
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color:
                          a < b * 0.8 ? Color(0xFFB52929) : Color(0xFF29B540),
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600)),
              TextSpan(
                  text: c < 0 ? c.toString() : "+${c.toString()}",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: c < 0 ? Color(0xFFB52929) : Color(0xFF29B540),
                      fontSize: fontSize - getText(5),
                      fontWeight: FontWeight.w600)),
            ]),
          ),
          SizedBox(height: getHeight(6))
        ]),
        Text('/',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(dcolor),
                fontSize: fontSize,
                fontWeight: FontWeight.w600)),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(height: 6),
          Text(b.toString(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(dcolor).withOpacity(0.7),
                  fontSize: fontSize - getText(10),
                  fontWeight: FontWeight.w600)),
        ]),
      ])),
    ),
  );
}

double hkh(double a) {
  return (a * Get.height) / 683.4;
}

double hkw(double a) {
  return (a * Get.width) / 411.4;
}

double hkf(double a) {
  return a * Get.textScaleFactor;
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinv/size_config.dart';

class TransItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
              padding: EdgeInsets.only(left: getWidth(10.0)),
              child: Text(
                "Item ###",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: getText(20),
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.89),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: getWidth(10.0)),
              child: Text(
                "Qty pkt[10]",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: getText(20),
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.89),
                ),
              ),
            ),
            ],),
            
            Padding(
              padding: EdgeInsets.only(left: getWidth(10.0)),
              child: Text(
                "{ asdasdawdoidunaiwnduwiadnjasodinwoanduawbdwuadwadadawffawef }",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: getText(18),
                  fontWeight: FontWeight.normal,
                  color: Colors.white54,
                  fontStyle: FontStyle.italic
                ),
              ),
            ),
            
          ],
        ));
  }
}

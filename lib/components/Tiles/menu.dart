import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hinv/components/models/menuM.dart';
import 'package:hinv/size_config.dart';

class MenuCard extends StatefulWidget {
  final Menu menu;
  MenuCard(this.menu);
  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(20), vertical: getHeight(20)),
      width: getWidth(175),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(int.parse(widget.menu.color)).withOpacity(0.5),
                blurRadius: getText(18),
                spreadRadius: getText(1))
          ],
          color: Color(int.parse(widget.menu.color)),
          borderRadius: BorderRadius.circular(getWidth(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.menu.img,
            fit: BoxFit.contain,
            height: getHeight(60),
            width: getWidth(60),
          ),
          SizedBox(
            height: getHeight(10),
          ),
          Text(widget.menu.title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: getText(18),
                  fontWeight: FontWeight.w500)),
          SizedBox(height: getHeight(5)),
          Text(widget.menu.desc,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white.withOpacity(0.8),
                fontSize: getText(11),
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';
import 'package:hinv/bottomSheets/addToCart.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/components/models/cartItemM.dart';
import 'package:hinv/size_config.dart';

class ToOrder extends StatefulWidget {
  @override
  _ToOrderState createState() => _ToOrderState();
}

class _ToOrderState extends State<ToOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      child: GestureDetector(
        onTap: (){
          Get.bottomSheet(AddToCart(item: cart_list[2].item));
        },
              child: Container(
            width: getWidth(270),
            decoration: BoxDecoration(
                color: Color(0xFF1E212A),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF1E212A).withOpacity(0.4),
                      blurRadius: getText(18),
                      spreadRadius: getText(1))
                ],
                borderRadius: BorderRadius.circular(getHeight(17))),
            child: Row(children: <Widget>[
              SizedBox(
                  width: getWidth(70),
                  child: OverflowBox(
                      minHeight: 0,
                      minWidth: 0,
                      maxHeight: getHeight(80),
                      maxWidth: getWidth(147),
                      child: Container(
                        padding: EdgeInsets.only(right: getWidth(10)),
                        child: SvgPicture.asset(
                          'assets/images/roller.svg',
                          fit: BoxFit.fitHeight,
                        ),
                      ))),
              SizedBox(width: getWidth(10)),
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: getHeight(15), horizontal: getWidth(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Bearing ###',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: getText(18),
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: getHeight(5)),
                        Text('Bearing ###',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white38,
                                fontSize: getText(18),
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: getHeight(5)),
                        fraction(
                                    5000, 10000, 0xFFFFFFFF, getText(24)),
                      ],
                    )),
              )
            ])),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Items/itemPage.dart';
import 'package:hinv/bottomSheets/addToCart.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/components/models/cartItemM.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/size_config.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  ItemCard(this.item);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(10)),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(5), vertical: getHeight(5)),
        height: getHeight(120),
        width: getWidth(350),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getWidth(17)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child: Row(
              children: [
                Container(
                    height: getHeight(120),
                    width: getWidth(120),
                    child: SvgPicture.asset(
                      'assets/images/roller.svg',
                      fit: BoxFit.fitWidth,
                    )),
                Container(
                  width: getWidth(20),
                  color: Colors.white,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getHeight(10),
                      color: Colors.white,
                    ),
                    Container(
                      width: getWidth(150),
                      child: Text(widget.item.name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: getText(20),
                              fontWeight: FontWeight.w700)),
                    ),
                    Container(height: getHeight(5), color: Colors.white),
                    Container(
                      width: getWidth(150),
                      child: Text(widget.item.size,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black54,
                              fontSize: getText(16),
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      height: getHeight(10),
                      color: Colors.white,
                    ),
                    fraction(widget.item.quantity, 5, 0xFF000000, getText(24))
                  ],
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(AddToCart(item: widget.item));
              },
              child: Container(
                  height: getHeight(120),
                  width: getWidth(50),
                  decoration: BoxDecoration(
                      // color: Color(0xFF8A6C00).withOpacity(0.8),
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(getWidth(10))),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/images/icart+.svg',
                    fit: BoxFit.fitWidth,
                  ))),
            )
          ],
        ),
      ),
    );
  }
}

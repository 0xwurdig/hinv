import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/components/models/cartItemM.dart';
import 'package:hinv/size_config.dart';

class CartI extends StatefulWidget {
  final CartItem item;
  CartI({this.item});
  @override
  _CartIState createState() => _CartIState();
}

class _CartIState extends State<CartI> {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
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
                SizedBox(
                width: getWidth(90),
                child: OverflowBox(
                    minHeight: 0,
                    minWidth: 0,
                    maxHeight: getHeight(120),
                    maxWidth: getWidth(140),
                    child: Container(
                      padding: EdgeInsets.only(right: getWidth(10)),
                      child: SvgPicture.asset(
                        'assets/images/roller.svg',
                        fit: BoxFit.fitWidth,
                      ),
                    ))),
                SizedBox(
                  width:getWidth(40)
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
                      child: Text('Bearing ##aa',
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
                      child: Text("@ "+widget.item.item.price.toString()+"/"+widget.item.item.unit.toString() ,
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
                    cfraction(500, 1000, 0xFF000000, getText(24), widget.item.quantity)
                  ],
                ),
                SizedBox(
                  width:getWidth(20)
                ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: getHeight(35),
                  width: getWidth(35),
                  decoration: BoxDecoration(
                  color: Colors.black,
                    borderRadius: BorderRadius.circular(7)
                  ),
                  child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/icart+.svg',
                        fit: BoxFit.fitWidth,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.item.quantity++;
                        });
                      }),
                ),
                Text(widget.item.quantity.toString(), style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: widget.item.quantity < 0 ? Color(0xFFB52929) : Color(0xFF29B540),
                            fontSize: getText(19),
                            fontWeight: FontWeight.w600)),
                Container(
                  height: getHeight(35),
                  width: getWidth(35),
                  decoration: BoxDecoration(
                  color: Colors.black,
                    borderRadius: BorderRadius.circular(7)
                  ),
                  child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/icart-.svg',
                        fit: BoxFit.fitWidth,
                        height: getWidth(25),
                        width: getWidth(25),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.item.quantity--;
                        });
                      }),
                ),
              ],
            )
              ],
            )),
            // GestureDetector(
            //   onTap: () {
            //     Get.snackbar("Added", "to Cart", snackPosition: SnackPosition.BOTTOM, animationDuration: Duration(milliseconds: 300),duration: Duration(milliseconds: 1000) );
            //   },
            //   child: Container(
            //       height: getHeight(120),
            //       width: getWidth(50),
            //       decoration: BoxDecoration(
            //           // color: Color(0xFF8A6C00).withOpacity(0.8),
            //           color: Colors.black.withOpacity(0.7),
            //           borderRadius: BorderRadius.circular(getWidth(10))),
            //       child: Center(
            //           child: SvgPicture.asset(
            //         'assets/images/icart+.svg',
            //         fit: BoxFit.fitWidth,
            //       ))),
            // )
          ],
        ),
      );
  
  }
}

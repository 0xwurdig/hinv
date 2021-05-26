import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/size_config.dart';

class AddToCart extends StatefulWidget {
  final Item item;
  AddToCart({this.item});
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String total = '0';
  TextEditingController price = new TextEditingController(text: '0');
  TextEditingController qty = new TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        height: getHeight(350),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(children: [
          Container(
              height: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/images/bearing.svg',
                    height: 100,
                    width: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getHeight(20)),
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          child: Center(
                            child: Text(widget.item.name,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: getText(32),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Center(
                            child: Text(widget.item.size,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.yellow[800],
                                    fontSize: getText(20),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                child: Container(
                  height: 40,
                  child: Center(
                    child: Text("Enter the price :",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: getText(20),
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                child: IntrinsicWidth(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: price,
                    onChanged: (price) {
                      setState(() {
                        total =
                            (int.parse(qty.text) * int.parse(price)).toString();
                      });
                    },
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: getHeight(20),
                        fontWeight: FontWeight.w500),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.black,
                        // hintText: "Price",
                        // hintStyle: TextStyle(
                        //     fontFamily: 'Montserrat',
                        //     color: Colors.black,
                        //     fontSize: getHeight(20),
                        //     fontWeight: FontWeight.w500),
                        border: InputBorder.none
                        //fillColor: Colors.green
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                child: Container(
                  height: 40,
                  child: Center(
                    child: Text("Enter the Qty :",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: getText(20),
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                  child: Row(
                    children: [
                      Text(
                        "x ",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: getText(20),
                            fontWeight: FontWeight.w500),
                      ),
                      IntrinsicWidth(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: qty,
                          onChanged: (qty) {
                            setState(() {
                              total = (int.parse(qty) * int.parse(price.text))
                                  .toString();
                            });
                          },
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: getHeight(20),
                              fontWeight: FontWeight.w500),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              filled: true,
                              focusColor: Colors.black,
                              // hintText: "Qty",
                              // hintStyle: TextStyle(
                              //     fontFamily: 'Montserrat',
                              //     color: Colors.black,
                              //     fontSize: getHeight(20),
                              //     fontWeight: FontWeight.w500),
                              border: InputBorder.none
                              //fillColor: Colors.green
                              ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(height: getHeight(30)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.snackbar("Item Added to Cart", "${widget.item.name}",
                      backgroundColor: Colors.white.withOpacity(0.7));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: getHeight(70),
                  width: getWidth(220),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(getHeight(12))),
                  child: Text(
                    "+ Add to Cart",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: getText(26),
                        // fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      "\u{20B9} " + total,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: getText(36),
                          // fontWeight: FontWeight.w800,
                          color: Colors.yellow[900],
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

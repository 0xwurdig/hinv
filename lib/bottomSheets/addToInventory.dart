import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/size_config.dart';

class AddToInventory extends StatefulWidget {
  final Item item;
  AddToInventory(this.item);
  @override
  _AddToInventoryState createState() => _AddToInventoryState();
}

class _AddToInventoryState extends State<AddToInventory> {
  String total = '0';
  TextEditingController price = new TextEditingController(text: '0');
  TextEditingController qty = new TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        height: getHeight(300),
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
          newItemFraction(0xFF000000, 30),
          SizedBox(height: getHeight(40)),
                  GestureDetector(
                    onTap: (){
                       Get.back();
                    },
                                      child: Container(
                      alignment: Alignment.center,
                      height: getHeight(70),
                      width: getWidth(300),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(getHeight(12))),
                      child: Text(
                        "Add to Inv.",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: getText(30),
                            // fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
        ]),
      ),
    );
  }
}

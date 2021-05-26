import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Employees/empRecent.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/components/models/transactionM.dart';
import 'package:hinv/size_config.dart';

class ItemEditPage extends StatefulWidget {
  final Item item;
  ItemEditPage(this.item);
  @override
  _ItemEditPageState createState() => _ItemEditPageState();
}

class _ItemEditPageState extends State<ItemEditPage> {
  DateTime _from = DateTime.now();
  DateTime _to = DateTime.now();
  Future<Null> _selectDate(DateTime date) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (_datePicker != null && _datePicker != date) {
      setState(() {
        date = _datePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF764358),
        // Color(0xFF1E212A),

        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              padding:
                  EdgeInsets.only(top: getHeight(10), bottom: getHeight(20)),
              height: getHeight(550),
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(0xFF1E212A),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(getWidth(36)),
                      bottomRight: Radius.circular(getWidth(36)))),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getHeight(20), horizontal: getWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: getWidth(7), vertical: getHeight(7)),
                      //   height: getHeight(60),
                      //   width: getWidth(60),
                      //   child: SvgPicture.asset('assets/images/menu.svg'),
                      // ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: getText(35),
                        ),
                      ),

                      Text(
                        "In-Stock",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: getText(38),
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.check,
                              color: Colors.white, size: getText(45))),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(children: [
                    Container(
                        // padding: EdgeInsets.symmetric(
                        //     vertical: getHeight(10), horizontal: getWidth(10)),
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              height: getHeight(120),
                              width: getWidth(120),
                              child: SvgPicture.asset(
                                'assets/images/roller.svg',
                                height: getHeight(120),
                                width: getWidth(120),
                                fit: BoxFit.fitWidth,
                              )),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: getWidth(10)),
                            height: getHeight(51),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.item.name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: getHeight(24),
                                              fontWeight: FontWeight.w800)),
                                      Text('Size: ' + widget.item.size,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: getHeight(18),
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),

                                  //     Container(
                                  // height: getHeight(120),
                                  // width: getWidth(120),
                                  // child: SvgPicture.asset(
                                  //   'assets/images/roller.svg',
                                  //   height: getHeight(120),
                                  //   width: getWidth(120),
                                  //   fit: BoxFit.fitWidth,
                                  // )),
                                  efraction(widget.item.quantity, 10,
                                      0xFFFFFFFF, getHeight(28))
                                ]),
                          ),
                          Divider(
                            color: Colors.white54,
                            thickness: 1,
                          ),
                          Container(
                              width: Get.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getWidth(10.0)),
                                        child: Text(
                                          "Description",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: getText(18),
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.white.withOpacity(0.89),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: getWidth(10.0)),
                                        child: Text(
                                          widget.item.unit + "/unit",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: getText(18),
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Colors.white.withOpacity(0.89),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  descTF(widget.item.description)
                                ],
                              )),
                        ],
                      ),
                    )),
                  ]),
                ),
              ])),
          Container(
            child: Text('__________',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: getText(18),
                    fontWeight: FontWeight.w900)),
          ),
          SizedBox(
            height: getText(20),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                'Edit Mode',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white.withOpacity(0.7),
                    fontSize: getText(50),
                    fontWeight: FontWeight.w700),
              ))
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: getWidth(30), vertical: getHeight(10)),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text('Recents..',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontFamily: 'Montserrat',
          //             color: Colors.white,
          //             fontSize: getText(24),
          //             fontWeight: FontWeight.w700)),
          //   ),
          // ),
          // for (Transaction a in transactionList) EmpRecTile(a),
          // SizedBox()
        ])));
  }
}

Widget descTF(String a) {
  TextEditingController desc = new TextEditingController(text: a);
  return Padding(
    padding: EdgeInsets.only(top: getHeight(10), left: getWidth(10.0)),
    child: Container(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        controller: desc,
        maxLines: 10,
        scrollPadding: EdgeInsets.zero,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: getText(16),
            fontWeight: FontWeight.normal,
            color: Colors.white54,
            fontStyle: FontStyle.italic),
        decoration: InputDecoration(
          // hintMaxLines: 10,
          // hintText:
          // "Consider applying a flex factor (e.g. using an Expanded widget) to force the children of the RenderFlex to fit within the available space instead of being sized to their natural size. This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView.",
          border: InputBorder.none,
          hintStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: getText(16),
              fontWeight: FontWeight.normal,
              color: Colors.white54,
              fontStyle: FontStyle.italic),
        ),
      ),
    ),
    // Text(
    //   "Consider applying a flex factor (e.g. using an Expanded widget) to force the children of the RenderFlex to fit within the available space instead of being sized to their natural size. This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView.",
    //   overflow: TextOverflow.clip,
    // style: TextStyle(
    //     fontFamily: 'Montserrat',
    //     fontSize: getText(16),
    //     fontWeight: FontWeight.normal,
    //     color: Colors.white54,
    //     fontStyle: FontStyle.italic),
    // ),
  );
}

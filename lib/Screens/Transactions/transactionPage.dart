import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Employees/empListPage.dart';
import 'package:hinv/Screens/Transactions/transItems.dart';
import 'package:hinv/Screens/Transactions/transListPage.dart';
import 'package:hinv/components/Tiles/emp.dart';
import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/components/models/transactionM.dart';
import 'package:hinv/size_config.dart';

class TransactionPage extends StatefulWidget {
  final Transaction emp;
  TransactionPage(this.emp);
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    String _ilist = '';
    for (Item e in widget.emp.itemList) {
      _ilist = _ilist + e.name + ',';
    }
    _ilist = _ilist.substring(0, _ilist.length - 1);
    return Scaffold(
        backgroundColor: Color(0xFF0C7878),
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Color(0xFF1E212A),
        // leading: Padding(
        //   padding:  EdgeInsets.all(6.0),
        //   child: IconButton(
        //       icon: Icon(
        //         Icons.arrow_back_ios,
        //         color: Colors.white,
        //         size: 35,
        //       ),
        //       onPressed: () {
        //         Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => EmployeeListPage()));
        //       }),
        // ),
        // title: Center(
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 6.0),
        //     child: Text(
        //       "Employees",
        //       style: TextStyle(
        //         fontFamily: 'Montserrat',
        //         fontSize: 36,
        //         fontWeight: FontWeight.w800,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        //   actions: [
        // Padding(
        //     padding: const EdgeInsets.only(right: 10, top: 8),
        //     child: Container(
        //       padding: EdgeInsets.all(9),
        //       height: 60,
        //       width: 60,
        //       child: SvgPicture.asset('assets/images/editw.svg'),
        //     )),
        //   ],
        // ),

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
                      bottomLeft: Radius.circular(getHeight(36)),
                      bottomRight: Radius.circular(getHeight(36)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                          "Transaction",
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
                          child: Icon(
                            Icons.sort,
                            color: Colors.white,
                            size: getText(37),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(10)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: getWidth(10)),
                          child: Text(
                            "DoI : " + widget.emp.time,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: getText(20),
                              // fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: getWidth(200),
                        padding: EdgeInsets.only(right: getWidth(10)),
                        child: Text(
                          "Items : " + widget.emp.itemList.length.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: getText(20),
                            // fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(10)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: getWidth(10)),
                          child: Text(
                            "Id : " + widget.emp.id,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: getText(20),
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        padding: EdgeInsets.only(right: getWidth(10)),
                        child: Text(
                          "\u{20B9} " + widget.emp.amount.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: getText(20),
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHeight(20)),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(height: getHeight(10)),
                  Container(
                    height: getHeight(220),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TransItems(),
                          TransItems(),
                          TransItems(),
                          TransItems(),
                          TransItems(),
                          TransItems(),
                          ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height:20
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.center,
                      height: getHeight(70),
                      width: getWidth(300),
                      decoration: BoxDecoration(
                          color: Color(0xFF0C7878),
                          borderRadius: BorderRadius.circular(getWidth(12))),
                      child: Text(
                        "View Reciept",
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
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('__________',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: getText(18),
                      fontWeight: FontWeight.w900)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(30), vertical: getHeight(10)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Items..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white.withOpacity(0.9),
                        fontSize: getText(24),
                        fontWeight: FontWeight.w700)),
              ),
            ),
            for (Item a in widget.emp.itemList) _transItemsTile(a),
            Divider(
              color: Colors.white,
              thickness: getHeight(2),
            ),
            SizedBox(height: getHeight(10)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: getWidth(30)),
                  child: (Text("Total",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white.withOpacity(0.9),
                          fontSize: getText(24),
                          fontWeight: FontWeight.w700))),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: getWidth(30)),
                  child: (Text("\u{20B9} " + widget.emp.amount.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white.withOpacity(0.9),
                          fontSize: getText(24),
                          fontWeight: FontWeight.w700))),
                ),
              ),
            ]),
            SizedBox(height: getHeight(30))
          ]),
        ));
  }
}

Widget _transItemsTile(Item transaction) {
  return (Padding(
    padding: EdgeInsets.symmetric(vertical: getHeight(15.0)),
    child: Container(
      padding: EdgeInsets.only(right: getWidth(10)),
      height: getHeight(80),
      width: getWidth(350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getWidth(10)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: getHeight(80),
              width: getWidth(90),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getWidth(10))),
              child: SizedBox(
                  width: getWidth(70),
                  child: OverflowBox(
                      minHeight: 0,
                      minWidth: 0,
                      maxHeight: getHeight(70),
                      maxWidth: getWidth(120),
                      child: Container(
                        padding: EdgeInsets.only(right: getWidth(10)),
                        child: SvgPicture.asset(
                          'assets/images/roller.svg',
                          fit: BoxFit.fitHeight,
                        ),
                      ))),
            ),
            SizedBox(width: getWidth(14)),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getWidth(150),
                      padding: EdgeInsets.only(top: getHeight(10)),
                      child: Text(transaction.name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Montserrat',
                              fontSize: getText(20),
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: getHeight(13)),
                      child: Text(
                          transaction.price.toString() +
                              "/" +
                              transaction.unit +
                              ' x ' +
                              transaction.quantity.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white70,
                              fontSize: getText(14),
                              fontWeight: FontWeight.w500)),
                    ),
                  ]),
            ),
            Text('\u{20B9} ${transaction.total}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: getText(24),
                    fontWeight: FontWeight.w500)),
          ]),
    ),
  ));
}

// Container(
//                   height: 70,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     color: Color(0xFF44539F),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 100,
//                           width: 90,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Center(
//                             child: Text(getInitials(emp.name),
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontFamily: 'Montserrat',
//                                     color: Colors.black87,
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.w600)),
//                           ),
//                         ),
//                         SizedBox(width: 30),
//                         Expanded(
//                           child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.only(top: 7),
//                                   child: Text(emp.name,
//                                       overflow: TextOverflow.ellipsis,
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(
//                                           fontFamily: 'Montserrat',
//                                           color: Colors.white70,
//                                           fontSize: 21,
//                                           fontWeight: FontWeight.w600)),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 10),
//                                   child: Text(
//                                       "Last Active: ${emp.lastSeen}",
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontFamily: 'Montserrat',
//                                           color: Colors.white38,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                         ),
//                       ]));

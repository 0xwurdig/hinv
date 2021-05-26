import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/components/Tiles/trans.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/components/models/transactionM.dart';
import 'package:hinv/size_config.dart';

class TransactionListPage extends StatefulWidget {
  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  bool sortByDate = true;
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
      backgroundColor: Color(0xFF0C7878),
      // Color(0xFF1E212A),
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: getHeight(10), bottom: getHeight(20)),
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
                    "Transactions",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: getText(38),
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sortByDate = !sortByDate;
                      });
                    },
                    child: sortByDate==false? Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: getText(37),
                    ) : Icon(
                      Icons.sort,
                      color: Colors.white,
                      size: getText(37),
                    ),
                  ),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: RaisedButton(
                    child: Text(
                      _from.toString().split(' ')[0],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: getText(20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _selectDate(_from);
                    },
                    color: Color(0xFF1E212A),
                    elevation: 0,
                  ),
                ),
              ),
              Text(
                "- To -",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: getText(20),
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(),
                  child: RaisedButton(
                    child: Text(
                      _to.toString().split(' ')[0],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: getText(20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _selectDate(_from);
                    },
                    color: Color(0xFF1E212A),
                    elevation: 0,
                  ),
                ),
              ),
            ]),

            SizedBox(
              height: getHeight(20),
            ),
            Expanded(
              child: Container(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    TransactionTileAnimation(transactionList[1]),
                    TransactionTileAnimation(transactionList[1]),
                    TransactionTileAnimation(transactionList[1]),
                    TransactionTileAnimation(transactionList[1]),
                  ],
                ),
              )),
            )

            // EmployeeTile(empList[0]),
            // EmployeeTile(empList[0]),
            // EmployeeTile(empList[0]),
            // EmployeeTile(empList[0]),
            // EmployeeTile(empList[0]),
          ]),
        ),
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
                "All Trans",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white.withOpacity(0.7),
                    fontSize: getText(50),
                    fontWeight: FontWeight.w700),
              ))
      ]),
    );
  }
}

// Container empListBuilder(){
//   return Container(
//     child: Column(children: [
//               EmployeeTileAnimation(empList[0]),
//               EmployeeTileAnimation(empList[0]),
//               EmployeeTileAnimation(empList[0]),
//               EmployeeTileAnimation(empList[0]),
//               EmployeeTileAnimation(empList[0]),
//               // EmployeeTile(empList[0]),
//               // EmployeeTile(empList[0]),
//               // EmployeeTile(empList[0]),
//               // EmployeeTile(empList[0]),
//               // EmployeeTile(empList[0]),
//             ]),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Employees/empListPage.dart';
import 'package:hinv/Screens/Employees/empRecent.dart';
import 'package:hinv/Screens/Employees/empTrans.dart';
import 'package:hinv/bottomSheets/removeEmp.dart';
import 'package:hinv/components/Tiles/emp.dart';
import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/components/models/transactionM.dart';
import 'package:hinv/size_config.dart';

class EmployeePage extends StatefulWidget {
  final Employee emp;
  EmployeePage(this.emp);
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF44539F),
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Color(0xFF1E212A),
        // leading: Padding(
        //   padding: const EdgeInsets.all(6.0),
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
              padding: EdgeInsets.only(top: getHeight(10), bottom: getHeight(20)),
              height: getHeight(550),
              width: Get.height,
              decoration: BoxDecoration(
                  color: Color(0xFF1E212A),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(getWidth(36)),
                      bottomRight: Radius.circular(getWidth(36)))),
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
                          "Employee",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: getText(38),
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                        onTap: () {
                          Get.bottomSheet(RemoveEmp(widget.emp));
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: getText(35),
                        )
                      ),
                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(10)),
                  Container(
                    height: getHeight(180),
                    width: getWidth(180),
                    decoration: BoxDecoration(
                        color: Color(0xFF6A6868),
                        borderRadius: BorderRadius.circular(getWidth(17))),
                  ),
                  SizedBox(height: getHeight(20)),
                  Text(
                    widget.emp.name,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: getText(34),
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: getHeight(10)),
                  Text(
                    widget.emp.phn.toString(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: getText(24),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: getWidth(10)),
                          child: Text(
                            "DoJ : " + widget.emp.doj,
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
                          "Transactions : 1000",
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
                  SizedBox(height: getHeight(20)),
                  GestureDetector(
                    onTap: (){
                       Get.to(EmpTransPage(widget.emp));
                    },
                                      child: Container(
                      alignment: Alignment.center,
                      height: getHeight(70),
                      width: getWidth(300),
                      decoration: BoxDecoration(
                          color: Color(0xFF44539F),
                          borderRadius: BorderRadius.circular(getHeight(12))),
                      child: Text(
                        "Transactions",
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
            Container(
              child: Text('__________',
                  textAlign: TextAlign.center,
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
                child: Text('Recents..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: getText(24),
                        fontWeight: FontWeight.w700)),
              ),
            ),
            for (Transaction a in transactionList) EmpRecTile(a)
          ]),
        ));
  }
}

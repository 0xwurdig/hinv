import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/components/Tiles/emp.dart';
import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/size_config.dart';

class EmployeeListPage extends StatefulWidget {
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  bool sortByDate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF44539F),
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: getHeight(10), bottom: getHeight(20)),
          height: getHeight(550),
          width: Get.width,
          decoration: BoxDecoration(
              color: Color(0xFF1E212A),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36))),
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
                          "Employees",
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((getWidth(17))),
                  ),
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EmployeeTileAnimation(empList[0]),
                      EmployeeTileAnimation(empList[0]),
                      EmployeeTileAnimation(empList[0]),
                      EmployeeTileAnimation(empList[0]),
                      EmployeeTileAnimation(empList[0]),
                    ],
                  ),
                )),
              ),
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
        SizedBox(height: getHeight(50)),
        Container(
          
          height: getHeight(48),
          width: getWidth(158),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(getWidth(12))),
          child: Center(
            child: Text("+",
                style:
                    TextStyle(fontSize: getText(48), color: Color(0xFF44539F))),
          ),
        ),
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

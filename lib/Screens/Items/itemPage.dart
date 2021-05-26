import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Employees/empRecent.dart';
import 'package:hinv/Screens/Items/itemEdit.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/components/models/transactionM.dart';
import 'package:hinv/size_config.dart';


class ItemPage extends StatefulWidget {
  final Item item;
  ItemPage(this.item);
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
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
                          Get.to(ItemEditPage(widget.item));
                        },
                        child: SvgPicture.asset(
                          'assets/images/editw.svg',
                          height: getHeight(27),
                          width: getWidth(27),
                        ),
                      ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      Text('Size: '+widget.item.size,
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
                                  fraction(widget.item.quantity, 5, 0xFFFFFFFF, getHeight(28))
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
                                          widget.item.unit+"/unit",
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: getHeight(10),
                                        left: getWidth(10.0)),
                                    child: Text(
                                      widget.item.description,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: getText(16),
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white54,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Container(
                                    child: sample5(context),
                                  ),
                                ],
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                        ],
                      ),
                    )),
                  ]),
                ),
                Container(
                  alignment: Alignment.center,
                  height: getHeight(70),
                  width: getWidth(300),
                  decoration: BoxDecoration(
                      color: Color(0xFF764358),
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(getHeight(12))),
                  child: Text(
                    "Transactions",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: getHeight(30),
                        // fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
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
          for (Transaction a in transactionList) EmpRecTile(a),
          SizedBox()
        ])));
  }
}

Widget sample5(BuildContext context) {
  final fromDate = DateTime(2012, 11, 22);
  final toDate = DateTime(2018);
  List<DataPoint<DateTime>> list = [
    DataPoint<DateTime>(value: 10, xAxis: DateTime(2012, 10, 1)),
    DataPoint<DateTime>(value: 50, xAxis: DateTime(2013, 10, 1)),
    DataPoint<DateTime>(value: 100, xAxis: DateTime(2014, 10, 1)),
    DataPoint<DateTime>(value: 100, xAxis: DateTime(2015, 10, 1)),
    DataPoint<DateTime>(value: 40, xAxis: DateTime(2016, 10, 1)),
    DataPoint<DateTime>(value: 47, xAxis: DateTime(2017, 10, 1)),
    DataPoint<DateTime>(value: 70, xAxis: DateTime(2018, 10, 1)),
  ];

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 300));
  final date4 = DateTime.now().subtract(Duration(days: 320));

  final date5 = DateTime.now().subtract(Duration(days: 650));
  final date6 = DateTime.now().subtract(Duration(days: 2000));

  final date7 = DateTime.now().subtract(Duration(days: 2500));

  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(
        bezierChartScale: BezierChartScale.YEARLY,
        fromDate: fromDate,
        toDate: toDate,
        selectedDate: toDate,
        series: [
          BezierLine(
            label: "Duty",
            data: [
              DataPoint<DateTime>(value: 10, xAxis: DateTime(2012, 10, 1)),
              DataPoint<DateTime>(value: 50, xAxis: DateTime(2013, 10, 1)),
              DataPoint<DateTime>(value: 100, xAxis: DateTime(2014, 10, 1)),
              DataPoint<DateTime>(value: 100, xAxis: DateTime(2015, 10, 1)),
              DataPoint<DateTime>(value: 40, xAxis: DateTime(2016, 10, 1)),
              DataPoint<DateTime>(value: 47, xAxis: DateTime(2017, 10, 1)),
              DataPoint<DateTime>(value: 70, xAxis: DateTime(2018, 10, 1)),
            ],
          ),
          BezierLine(
            label: "Flight",
            lineColor: Colors.white10,
            data: [
              DataPoint<DateTime>(value: 101, xAxis: DateTime(2012, 10, 1)),
              DataPoint<DateTime>(value: 501, xAxis: DateTime(2013, 10, 1)),
              DataPoint<DateTime>(value: 1010, xAxis: DateTime(2014, 10, 1)),
              DataPoint<DateTime>(value: 1010, xAxis: DateTime(2015, 10, 1)),
              DataPoint<DateTime>(value: 401, xAxis: DateTime(2016, 10, 1)),
              DataPoint<DateTime>(value: 471, xAxis: DateTime(2017, 10, 1)),
              DataPoint<DateTime>(value: 701, xAxis: DateTime(2018, 10, 1)),
            ],
          ),
        ],
        config: BezierChartConfig(
            stepsYAxis: 200,
            displayYAxis: true,
            pinchZoom: true,
            yAxisTextStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: getText(14)),
            showDataPoints: false,
            displayDataPointWhenNoValue: false,
            footerHeight: 35.0,
            bubbleIndicatorColor: Color(0xFF764358),
            showVerticalIndicator: false),
      ),
    ),
  );
}

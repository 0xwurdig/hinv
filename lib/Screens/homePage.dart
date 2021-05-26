import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Cart/cartPage.dart';
import 'package:hinv/Screens/Employees/empListPage.dart';
import 'package:hinv/Screens/Items/itemListPage.dart';
import 'package:hinv/Screens/Transactions/transListPage.dart';
import 'package:hinv/components/Tiles/menu.dart';
import 'package:hinv/components/Tiles/recent.dart';
import 'package:hinv/components/Tiles/toOrder.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/components/models/cartItemM.dart';
import 'package:hinv/components/models/menuM.dart';
import 'package:hinv/components/models/transactionM.dart';
import 'package:hinv/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E212A),
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
      // appBar: AppBar(

      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Center(
      //     child: Text(
      //       "Inventory",
      //       style: TextStyle(
      //         fontFamily: 'Montserrat',
      //         fontSize: 36,
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xff676A75),
      //       ),
      //     ),
      //   ),
      // ),
      // body: NestedScrollView(
      //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //       return <Widget>[
      //         new SliverAppBar(
      //           toolbarHeight: 100,
      //           backgroundColor: Colors.red,
      //           leading: Padding(
      //             padding: EdgeInsets.only(left: getWidth(10), top:getHeight(8)),
      //             child: Container(
      //               padding: EdgeInsets.symmetric(horizontal: getWidth(7), vertical: getHeight(7)),
      //               height: getHeight(60),
      //               width: getWidth(60),
      //                 child: SvgPicture.asset('assets/images/menu.svg'),)
      //           ),
      //           title: Center(
      //             child: Padding(
      //               padding: EdgeInsets.only(top: getHeight(8)),
      //               child: Text(
      //                 "Inventory",
      //                 style: TextStyle(
      //                   fontFamily: 'Montserrat',
      //                   fontSize: getHeight(36),
      //                   fontWeight: FontWeight.w800,
      //                   color: Color(0xff676A75),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           actions: [
      //             Padding(
      //             padding:EdgeInsets.only(right: getWidth(10), top: getHeight(8)),
      //             child: Container(
      //                 padding: EdgeInsets.symmetric(horizontal: getWidth(7), vertical: getHeight(7)),
      //               height: getHeight(60),
      //               width: getWidth(60),
      //                 child: SvgPicture.asset('assets/images/cart.svg'),)
      //           ),
      //           ],
      //         ),
      //       ];
      //     },
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: getHeight(10)),
                Row(children: [

                  Container(
                    
                    height: getHeight(80),
                    width: getWidth(80),
                    decoration: BoxDecoration(
                        color: Color(0xFF6A6868),
                        borderRadius: BorderRadius.circular(getWidth(100))),
                  ),
                  SizedBox(width: getHeight(20)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                  Text(
                    "Rajesh",
                    style: TextStyle(
                      fontFamily: 'Montserrat', 
                      fontSize: getText(20),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Director",
                    style: TextStyle(
                      fontFamily: 'Montserrat', 
                      fontSize: getText(14),
                      fontWeight: FontWeight.w500,
                      color: Colors.white54,
                    ),
                  ),
                    ],
                  )
                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(

      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * Get.width,
      right: isCollapsed ? 0 : -0.2 * Get.width,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(17)),
          elevation: 0,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Color(0xFF1E212A),
              borderRadius: BorderRadius.circular(getHeight(17)),
              boxShadow: [
            BoxShadow(
                color: Colors.black,
                
                blurRadius: getText(15),
                spreadRadius: getText(1))
          ],
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: getHeight(550),
                  width: Get.width,
                  padding: EdgeInsets.only(top: getHeight(10)),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(getHeight(36)),
                          bottomRight: Radius.circular(getHeight(36)))),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: getHeight(20), horizontal: getWidth(20)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                                setState(() {
                                  if (isCollapsed)
                                    _controller.forward();
                                  else
                                    _controller.reverse();

                                  isCollapsed = !isCollapsed;
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/images/menu.svg',
                                height: getHeight(27),
                                width: getWidth(27),
                              ),
                            ),
                            SizedBox(
                              width: getWidth(45),
                            ),
                            Text(
                              "Inventory",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: getText(42),
                                fontWeight: FontWeight.w800,
                                color: Color(0xff676A75),
                              ),
                            ),
                            SizedBox(
                              width: getWidth(45),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(CartPage());
                              },
                              child: cart_list.length != 0
                                  ? Badge(
                                      badgeContent: Text(
                                        "${cart_list.length}",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: getText(13),
                                            fontWeight: FontWeight.w800),
                                      ),
                                      badgeColor: Color(0xFFD4B132),
                                      child: SvgPicture.asset(
                                        'assets/images/cart.svg',
                                        height: getHeight(29),
                                        width: getWidth(29),
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      'assets/images/cart.svg',
                                      height: getHeight(29),
                                      width: getWidth(29),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(30), vertical: getHeight(8)),
                        child: Text(
                          "To Order..",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: getText(24),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 150,
                    //     child: Center(
                    //     child:
                    //         ListView(scrollDirection: Axis.horizontal,addRepaintBoundaries: false, children: [
                    //       ToOrder(),
                    //       ToOrder(),
                    //       ToOrder(),
                    //     ]),
                    //   ),
                    // ),
                    Container(
                      height: getHeight(160),
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                              top: getHeight(20),
                              bottom: getHeight(20),
                              left: getWidth(20)),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext ctx, int index) =>
                              ToOrder()),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(30)),
                        child: Text(
                          "Menu..",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: getText(24),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Container(
                      height: getHeight(208),
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                            top: getHeight(20),
                            bottom: getHeight(20),
                            left: getWidth(20)),
                        itemCount: mList.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          Menu m = mList[index];
                          return GestureDetector(
                              onTap: () {
                                if (m.title == "Employees") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EmployeeListPage()));
                                }
                                if (m.title == "Transactions") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TransactionListPage()));
                                }
                                if (m.title == "Items") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ItemListPage()));
                                }
                              },
                              child: Row(children: [
                                MenuCard(m),
                                SizedBox(width: getWidth(20)),
                              ]));
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ]),
                ),
                Container(
                  color: Color(0xFF1E212A),
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
                            color: Colors.white.withOpacity(0.9),
                            fontSize: getText(18),
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                for (Transaction e in transactionList) RecentCard(e),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

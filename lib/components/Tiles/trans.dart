import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Employees/empPage.dart';
import 'package:hinv/Screens/Transactions/transactionPage.dart';
import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/components/models/transactionM.dart';
import 'package:hinv/size_config.dart';
import 'package:page_transition/page_transition.dart';

import '../gen.dart';

class TransactionTileAnimation extends StatefulWidget {
  final Transaction transaction;
  TransactionTileAnimation(this.transaction);
  @override
  _TransactionTileAnimationState createState() =>
      _TransactionTileAnimationState();
}

class _TransactionTileAnimationState extends State<TransactionTileAnimation>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Get.to(TransactionPage(widget.transaction),
              transition: Transition.rightToLeft);
          Future.delayed(Duration(milliseconds: 200), () {
            _scaleController.reset();
            _isTapped = false;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    String _ilist = '';
    for (Item e in widget.transaction.itemList) {
      _ilist = _ilist + e.name + ',';
    }
    _ilist = _ilist.substring(0, _ilist.length - 1);
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = true;
        });
        _scaleController.forward();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getHeight(10)),
        child: Container(
          height: getHeight(100),
          width: getWidth(350),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(getWidth(10)),
          ),
          child: !_isTapped
              ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: getHeight(100),
                    width: getWidth(100),
                    decoration: BoxDecoration(
                        color: Color(0xFF0C7878),
                        // color: widget.transaction.type == "out"
                        //     ? Color(0xFFB30F24)
                        //     : Color(0xFF007D2B),
                        borderRadius: BorderRadius.circular(getWidth(10))),
                    child: Center(
                      child: Text(getInitials(widget.transaction.employee.name),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white70,
                              fontSize: getText(30),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(width: getWidth(14)),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: getWidth(100),
                          padding: EdgeInsets.only(top: getHeight(15)),
                          child: Text(_ilist,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: getText(24),
                                  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: getHeight(25.0)),
                          child: Text(
                            widget.transaction.time,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: getText(14),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                  SizedBox(width: 20),
                  widget.transaction.type == "in"
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getWidth(6), vertical: getHeight(6)),
                          child: Text(
                              '\u{20B9} ${widget.transaction.amount.toString()}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: getText(26),
                                  fontWeight: FontWeight.w500)),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getWidth(6), vertical: getHeight(6)),
                          child: Text('-- --',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: getText(20),
                                  fontWeight: FontWeight.w500)))
                ])
              : Stack(children: [
                  AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, build) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(20), vertical: getHeight(31)),
                      height: getHeight(100),
                      width:
                          getWidth(120) + _scaleAnimation.value * getWidth(400),
                      decoration: BoxDecoration(
                          color: Color(0xFF0C7878),
                          borderRadius: BorderRadius.circular(getWidth(10))),
                      child: Text(getInitials(widget.transaction.employee.name),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white70,
                              fontSize: getText(30),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ]),
        ),
      ),
    );
  }
}

// class EmployeeTile extends StatefulWidget {
//   final Employee emp;
//   EmployeeTile(this.emp);
//   @override
//   _EmployeeTileState createState() => _EmployeeTileState();
// }

// class _EmployeeTileState extends State<EmployeeTile> {
//   Employee _isTapped;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isTapped = widget.emp;
//         });
//         return TweenAnimationBuilder(tween: Tween<double>(begin: 0,end:1), duration: Duration(milliseconds: 500), builder: )
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Container(
//           padding: EdgeInsets.only(right: 10),
//           height: 100,
//           width: 350,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//             Container(
//               height: 100,
//               width: 120,
//               decoration: BoxDecoration(
//                   color: Color(0xFF44539F),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Center(
//                 child: Text(getInitials(widget.emp.name),
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontFamily: 'Montserrat',
//                         color: Colors.white70,
//                         fontSize: 30,
//                         fontWeight: FontWeight.w600)),
//               ),
//             ),
//             SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 6.0, vertical: 15),
//                       child: Text(widget.emp.name,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                               fontFamily: 'Montserrat',
//                               color: Colors.black87,
//                               fontSize: 28,
//                               fontWeight: FontWeight.w600)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 6.0),
//                       child: Text("Last Active: ${widget.emp.lastSeen}",
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontFamily: 'Montserrat',
//                               color: Colors.black38,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500)),
//                     ),
//                   ]),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// String getInitials(name) {
//   List<String> names = name.split(" ");
//   String initials = "";
//   int numWords = 2;

//   if (numWords < names.length) {
//     numWords = names.length;
//   }
//   for (var i = 0; i < numWords; i++) {
//     initials += '${names[i][0]}';
//   }
//   return initials;
// }

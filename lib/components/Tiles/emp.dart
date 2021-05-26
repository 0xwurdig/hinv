import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Employees/empPage.dart';
import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/size_config.dart';
import 'package:page_transition/page_transition.dart';

class EmployeeTileAnimation extends StatefulWidget {
  final Employee emp;
  EmployeeTileAnimation(this.emp);
  @override
  _EmployeeTileAnimationState createState() => _EmployeeTileAnimationState();
}

class _EmployeeTileAnimationState extends State<EmployeeTileAnimation>
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
          Get.to(EmployeePage(widget.emp),
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
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
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
            borderRadius: BorderRadius.circular((getWidth(17))),
          ),
          child: !_isTapped
              ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: getHeight(100),
                    width: getWidth(120),
                    decoration: BoxDecoration(
                        color: Color(0xFF44539F),
                        borderRadius: BorderRadius.circular(getWidth(17))),
                    child: Center(
                      child: Text(getInitials(widget.emp.name),
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
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(6.0), vertical: getHeight(15)),
                            child: Text(widget.emp.name,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black87,
                                    fontSize: getText(28),
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: getWidth(6.0)),
                            child: Text("Last Active: ${widget.emp.lastSeen}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black38,
                                    fontSize: getText(14),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ]),
                  ),
                ])
              : Stack(children: [
                  AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, build) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: getWidth(20), vertical: getHeight(31)),
                      height: getHeight(100),
                      width: getWidth(120) + _scaleAnimation.value * getWidth(400),
                      decoration: BoxDecoration(
                          color: Color(0xFF44539F),
                          borderRadius: BorderRadius.circular(getWidth(10))),
                      child: Text(getInitials(widget.emp.name),
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

String getInitials(name) {
  List<String> names = name.split(" ");
  String initials = "";
  int numWords = 2;

  if (numWords < names.length) {
    numWords = names.length;
  }
  for (var i = 0; i < numWords; i++) {
    initials += '${names[i][0]}';
  }
  return initials;
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

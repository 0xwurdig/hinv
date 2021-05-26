import 'package:flutter/material.dart';
import 'package:hinv/Screens/Transactions/transactionPage.dart';
import 'package:hinv/components/Tiles/emp.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/components/models/transactionM.dart';
import 'package:hinv/size_config.dart';

class EmpRecTile extends StatefulWidget {
  final Transaction transaction;
  EmpRecTile(this.transaction);
  @override
  _EmpRecTileState createState() => _EmpRecTileState();
}

class _EmpRecTileState extends State<EmpRecTile> {
  @override
  Widget build(BuildContext context) {
    String _ilist = '';
    for (Item asd in widget.transaction.itemList) {
      _ilist = _ilist + asd.name + ',';
    }
    _ilist = _ilist.substring(0, _ilist.length - 1);

    return (Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(15.0)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TransactionPage(widget.transaction)));
        },
        child: Container(
          padding: EdgeInsets.only(right: getWidth(10)),
          height: getHeight(80),
          width: getWidth(350),
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(getWidth(10)),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: getHeight(80),
              width: getWidth(90),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  // transaction.type == "out"
                  //       ? Color(0xFFB30F24).withOpacity(0.7)
                  //       : Color(0xFF007D2B).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(getWidth(10))),
              child: Center(
                child: Text(getInitials(widget.transaction.employee.name),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black.withOpacity(0.7),
                        fontSize: getText(30),
                        fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(width: getWidth(20)),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getWidth(150),
                      padding: EdgeInsets.only(top: getHeight(10)),
                      child: Text(_ilist,
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
                      child: Text(widget.transaction.time,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white38,
                              fontSize: getText(14),
                              fontWeight: FontWeight.w500)),
                    ),
                  ]),
            ),
            widget.transaction.type == "in"
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth(6), vertical: getHeight(6)),
                    child: Text(
                        '\u{20B9} ${widget.transaction.amount.toString()}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white.withOpacity(0.9),
                            fontSize: getText(24),
                            fontWeight: FontWeight.w500)),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth(6), vertical: getHeight(6)),
                    child: Text('-- --',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white.withOpacity(0.9),
                            fontSize: getText(20),
                            fontWeight: FontWeight.w500)))
          ]),
        ),
      ),
    ));
  }
}
// Widget _transTile(Transaction transaction) {
//   String _ilist = '';
//   for (Item asd in transaction.itemList) {
//     _ilist = _ilist + asd.name + ',';
//   }
//   _ilist = _ilist.substring(0, _ilist.length - 1);

//   return (Padding(
//     padding:   EdgeInsets.symmetric(vertical: 15.0),
//     child: GestureDetector(
//       onTap: (){

//       },
//           child: Container(
//         padding: EdgeInsets.only(right: 10),
//         height: 80,
//         width: 350,
//         decoration: BoxDecoration(
//           // color: Colors.white.withOpacity(0.8),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//           Container(
//             height: 80,
//             width: 90,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 // transaction.type == "out"
//                 //       ? Color(0xFFB30F24).withOpacity(0.7)
//                 //       : Color(0xFF007D2B).withOpacity(0.7),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Center(
//               child: Text(getInitials(transaction.employee.name),
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       color: Colors.black87,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w600)),
//             ),
//           ),
//           SizedBox(width: 14),
//           Expanded(
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Container(
//                 width: 150,
//                 padding:   EdgeInsets.all(6.0),
//                 child: Text(_ilist,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         color: Colors.white70,
//                         fontFamily: 'Montserrat',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700)),
//               ),
//               Padding(
//                 padding:   EdgeInsets.all(6.0),
//                 child: Text(transaction.time,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                         fontFamily: 'Montserrat',
//                         color: Colors.white38,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500)),
//               ),
//             ]),
//           ),
//           transaction.type == "in"
//               ? Padding(
//                   padding:   EdgeInsets.all(6.0),
//                   child: Text('\u{20B9} ${transaction.amount.toString()}',
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w500)),
//                 )
//               : Padding(
//                   padding:   EdgeInsets.all(6.0),
//                   child: Text('-- --',
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500)))
//         ]),
//       ),
//     ),
//   ));
// }

// // Container(
// //                   height: 70,
// //                   width: 350,
// //                   decoration: BoxDecoration(
// //                     color: Color(0xFF44539F),
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       children: [
// //                         Container(
// //                           height: 100,
// //                           width: 90,
// //                           decoration: BoxDecoration(
// //                               color: Colors.white,
// //                               borderRadius: BorderRadius.circular(10)),
// //                           child: Center(
// //                             child: Text(getInitials(emp.name),
// //                                 overflow: TextOverflow.ellipsis,
// //                                 textAlign: TextAlign.center,
// //                                 style: TextStyle(
// //                                     fontFamily: 'Montserrat',
// //                                     color: Colors.black87,
// //                                     fontSize: 30,
// //                                     fontWeight: FontWeight.w600)),
// //                           ),
// //                         ),
// //                         SizedBox(width: 30),
// //                         Expanded(
// //                           child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Container(
// //                                   padding: EdgeInsets.only(top: 7),
// //                                   child: Text(emp.name,
// //                                       overflow: TextOverflow.ellipsis,
// //                                       textAlign: TextAlign.start,
// //                                       style: TextStyle(
// //                                           fontFamily: 'Montserrat',
// //                                           color: Colors.white70,
// //                                           fontSize: 21,
// //                                           fontWeight: FontWeight.w600)),
// //                                 ),
// //                                 Padding(
// //                                   padding: EdgeInsets.only(bottom: 10),
// //                                   child: Text(
// //                                       "Last Active: ${emp.lastSeen}",
// //                                       overflow: TextOverflow.ellipsis,
// //                                       style: TextStyle(
// //                                           fontFamily: 'Montserrat',
// //                                           color: Colors.white38,
// //                                           fontSize: 14,
// //                                           fontWeight: FontWeight.w500)),
// //                                 ),
// //                               ]),
// //                         ),
// //                       ]));

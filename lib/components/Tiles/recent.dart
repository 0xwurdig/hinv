import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Transactions/transactionPage.dart';
import 'package:hinv/components/Tiles/trans.dart';
import 'package:hinv/size_config.dart';
import '../models/itemM.dart';
import 'package:hinv/components/models/transactionM.dart';

class RecentCard extends StatefulWidget {
  final Transaction transaction;
  RecentCard(this.transaction);
  @override
  _RecentCardState createState() => _RecentCardState();
}

class _RecentCardState extends State<RecentCard> {
  @override
  Widget build(BuildContext context) {
    String _ilist = '';
    for (Item e in widget.transaction.itemList) {
      _ilist = _ilist + e.name + ',';
    }
    _ilist = _ilist.substring(0, _ilist.length - 1);
    return Padding(
      padding:EdgeInsets.symmetric(vertical: getHeight(15)),
      child: GestureDetector(
        onTap: (){
         Get.to(TransactionPage(widget.transaction));
        },
              child: Container(
          height: getHeight(80),
          width: getWidth(350),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getWidth(10)),
            ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: getHeight(80),
              width: getWidth(90),
              decoration: BoxDecoration(
                  color: widget.transaction.type == "out"
                      ? Color(0xFFB30F24).withOpacity(0.7)
                      : Color(0xFF007D2B).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(getWidth(10))),
                  child: Center(child: Text(getInitials(widget.transaction.employee.name),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white70,
                          fontSize: getText(30),
                          fontWeight: FontWeight.w600)),),
            ),
            SizedBox(width: getWidth(14)),
            Expanded(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: getWidth(150),
                  padding: EdgeInsets.symmetric(horizontal: getWidth(6),vertical: getHeight(6) ),
                  child: Text(_ilist,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white70,
                          fontSize: getText(14),
                          fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(6),vertical: getHeight(6) ),
                  child: Text(widget.transaction.time,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white30,
                          fontSize: getText(14),
                          fontWeight: FontWeight.w500)),
                ),
              ]),
            ),
            widget.transaction.type == "in"?  Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(6),vertical: getHeight(6) ),
                  child: Text('\u{20B9} ${widget.transaction.amount.toString()}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: getText(24),
                          fontWeight: FontWeight.w500)),
                ): Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(6),vertical: getHeight(6) ),
                  child: Text('-- --',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: getText(20),
                          fontWeight: FontWeight.w500)))
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

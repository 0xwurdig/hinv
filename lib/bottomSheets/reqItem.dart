import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinv/size_config.dart';

class ReqItem extends StatefulWidget {
  @override
  _ReqItemState createState() => _ReqItemState();
}

class _ReqItemState extends State<ReqItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(10), vertical: getHeight(10)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Text.rich(
                    TextSpan(
                        text: "Couldnt",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: getText(36),
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                        children: [
                          TextSpan(
                              text: " Find an\n",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: getText(36),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none)),
                          TextSpan(
                              text: "Item ?",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: getText(36),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none)),
                        ]),
                    textAlign: TextAlign.center,
                  )
                  // child: Text(
                  //   "Couldnt Find an Item?",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //       fontFamily: 'Montserrat',
                  //       color: Colors.black,
                  //       fontSize: getHeight(36),
                  //       fontWeight: FontWeight.w500),
                  // ),
                  ),
              SizedBox(height: getHeight(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: TextFormField(
                  scrollPadding: EdgeInsets.zero,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: getHeight(24),
                      fontWeight: FontWeight.w400),
                  cursorColor: Colors.black,
                  cursorHeight: getHeight(30),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: getHeight(20), horizontal: getWidth(20)),
                      filled: true,
                      focusColor: Colors.black,
                      labelText: "Item Name",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w700),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(getHeight(25)),
                        borderSide: new BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(getHeight(25)),
                        borderSide: new BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                      ),
                      fillColor: Colors.white54
                      //fillColor: Colors.green
                      ),
                ),
              ),
              SizedBox(height: getHeight(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: TextFormField(
                  scrollPadding: EdgeInsets.zero,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: getHeight(24),
                      fontWeight: FontWeight.w400),
                  cursorColor: Colors.black,
                  cursorHeight: getHeight(30),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: getHeight(20), horizontal: getWidth(20)),
                      filled: true,
                      focusColor: Colors.black,
                      labelText: "Size / Sizes",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w700),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(getHeight(25)),
                        borderSide: new BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(getHeight(25)),
                        borderSide: new BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                      ),
                      fillColor: Colors.white54),
                ),
              ),
              SizedBox(height: getHeight(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Container(
                  child: TextFormField(
                    minLines: 4,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    scrollPadding: EdgeInsets.zero,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: getHeight(24),
                        fontWeight: FontWeight.w400),
                    cursorColor: Colors.black,
                    cursorHeight: getHeight(30),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: getHeight(20), horizontal: getWidth(20)),
                        filled: true,
                        focusColor: Colors.black,
                        labelText: "Description..",
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: getHeight(24),
                            fontWeight: FontWeight.w700),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius:
                              new BorderRadius.circular(getHeight(25)),
                          borderSide: new BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius:
                              new BorderRadius.circular(getHeight(25)),
                          borderSide: new BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                        ),
                        fillColor: Colors.white54),
                  ),
                ),
              ),
              SizedBox(height: getHeight(20)),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: getHeight(70),
                  width: getWidth(300),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(getHeight(12))),
                  child: Text(
                    "Send Request",
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
      ),
    );
  }
}

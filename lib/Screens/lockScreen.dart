import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/animations/loginButtonAnimation.dart';
import 'package:hinv/Screens/loginScreen.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/size_config.dart';

class LockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E212A),
      body: SingleChildScrollView(
        child: Container(
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getHeight(100),),
                Container(
                  
                  height: getHeight(120),
                  width: getWidth(250),
                  child:
                      SvgPicture.asset('assets/logo/hkw.svg', fit: BoxFit.fill),
                ),
                SizedBox(
                  height: getHeight(80),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Container(
                    child: Center(
                      child: TextFormField(
                        scrollPadding: EdgeInsets.zero,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: getText(24),
                            fontWeight: FontWeight.w400),
                        cursorColor: Colors.white,
                        cursorHeight: getHeight(30),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: getHeight(30), horizontal: getWidth(30)),
                          filled: true,
                          focusColor: Colors.black,
                          labelText: "ComPany CoDE..",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: getText(24),
                              fontWeight: FontWeight.w700),
                          fillColor: Colors.white10,
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(getText(25)),
                            borderSide: new BorderSide(
                                color: Colors.white, style: BorderStyle.solid),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(getText(25.0)),
                            borderSide: new BorderSide(
                                color: Colors.white, style: BorderStyle.solid),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Container(
                    child: Center(
                      child: TextFormField(
                        scrollPadding: EdgeInsets.zero,
                        obscureText: true,
                        obscuringCharacter: '#',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: getText(24),
                            fontWeight: FontWeight.w400),
                        cursorColor: Colors.white,
                        cursorHeight: getHeight(30),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: getHeight(30), horizontal: getWidth(30)),
                          filled: true,
                          focusColor: Colors.white,
                          labelText: "CoDe..",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: getText(24),
                              fontWeight: FontWeight.w700),
                          fillColor: Colors.white10,
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(getText(25),),
                            borderSide: new BorderSide(
                                color: Colors.white, style: BorderStyle.solid),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(getText(25),),
                            borderSide: new BorderSide(
                                color: Colors.white, style: BorderStyle.solid),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(40),
                ),
                ButtonLoginAnimation(
                  fontColor: Color(0xFF1E212A),
                  borderColor: Colors.white,
                  // background: Color(0xFFF1f94aa),
                  // borderColor: Color(0xFFF1a7a8c),
                  child: LoGinScreen(),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

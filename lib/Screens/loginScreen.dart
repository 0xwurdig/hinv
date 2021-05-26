import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/homePage.dart';
import 'package:hinv/animations/loginButtonAnimation.dart';
import 'package:hinv/Screens/lockScreen.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/size_config.dart';

class LoGinScreen extends StatefulWidget {
  @override
  _LoGinScreenState createState() => _LoGinScreenState();
}

class _LoGinScreenState extends State<LoGinScreen> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
                  child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://source.unsplash.com/collection/1094614'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter)),
            child: Align(
              alignment: Alignment.bottomCenter,
                        child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: getWidth(30), left:  getWidth(30), top: getHeight(90)),
                    child: Container(
                      height: getHeight(120),
                      width: getWidth(250),
                      child:
                          SvgPicture.asset('assets/logo/hkw.svg', fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    
                    height: getHeight(430),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(getHeight(25)),
                            topRight: Radius.circular(getHeight(25)))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: getHeight(30),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                          child: Text("Welcome",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: getHeight(32),
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: getHeight(10),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                          child: Text(
                            "Sign to continue..",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.amber,
                                fontSize: getHeight(30),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: getHeight(30)),
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
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getHeight(15),
                                    horizontal: getWidth(15)),
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                  size: getHeight(30),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: getHeight(20), horizontal: getWidth(20)),
                              filled: true,
                              focusColor: Colors.black,
                              labelText: "UserName",
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
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                        SizedBox(height: getHeight(20)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            obscuringCharacter: "#",
                            scrollPadding: EdgeInsets.zero,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: getHeight(24),
                                fontWeight: FontWeight.w400),
                            cursorColor: Colors.black,
                            cursorHeight: getHeight(30),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getHeight(15),
                                    horizontal: getWidth(15)),
                                child: Icon(
                                  Icons.vpn_key,
                                  color: Colors.black,
                                  size: getHeight(30),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: getHeight(15),
                                      horizontal: getWidth(15)),
                                  child: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black45,
                                    size: getHeight(30),
                                  ),
                                ),
                                onTap: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: getHeight(20), horizontal: getWidth(20)),
                              filled: true,
                              focusColor: Colors.black,

                              labelText: "PassWord",
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
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: ButtonLoginAnimation(
                        //       fontColor: Colors.white,
                        //       borderColor: Colors.black,
                        //       // background: Color(0xFFF1f94aa),
                        //       // borderColor: Color(0xFFF1a7a8c),
                        //       child: HomePage()),
                        // ),
                        SizedBox(
                          height: getHeight(30)
                        ),
                        ButtonLoginAnimation(
                              fontColor: Colors.white,
                              borderColor: Colors.black,
                              // background: Color(0xFFF1f94aa),
                              // borderColor: Color(0xFFF1a7a8c),
                              child: HomePage()),
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.white,
                  //   height: getHeight(121.5),
                  //   alignment: Alignment.topCenter,
                  //   child: ButtonLoginAnimation(
                  //             fontColor: Colors.white,
                  //             borderColor: Colors.black,
                  //             // background: Color(0xFFF1f94aa),
                  //             // borderColor: Color(0xFFF1a7a8c),
                  //             child: LockScreen()),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

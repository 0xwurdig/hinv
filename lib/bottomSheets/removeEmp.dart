import 'package:flutter/material.dart';
import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/size_config.dart';

class RemoveEmp extends StatefulWidget {
  final Employee emp;
  RemoveEmp(this.emp);
  @override
  _RemoveEmpState createState() => _RemoveEmpState();
}

class _RemoveEmpState extends State<RemoveEmp> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: 200,
      child: Column(children: [
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
                    vertical: getHeight(15), horizontal: getWidth(15)),
                child: Icon(
                  Icons.vpn_key,
                  color: Colors.black,
                  size: getHeight(30),
                ),
              ),
              suffixIcon: GestureDetector(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getHeight(15), horizontal: getWidth(15)),
                  child: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
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

              labelText: "Enter PassWord",
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: getHeight(24),
                  fontWeight: FontWeight.w600),
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
              //fillColor: Colors.green
            ),
          ),
        ),
        SizedBox(height: getHeight(20)),
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            height: getHeight(70),
            width: getWidth(300),
            decoration: BoxDecoration(
                color: Colors.black,
                // color: Color(0xFF44539F),
                borderRadius: BorderRadius.circular(getHeight(12))),
            child: Text(
              "Remove",
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
      ]),
    );
  }
}

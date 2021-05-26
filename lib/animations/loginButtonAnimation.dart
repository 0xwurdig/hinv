import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinv/size_config.dart';
import 'package:page_transition/page_transition.dart';

class ButtonLoginAnimation extends StatefulWidget {
  final String label;
  final Color background;
  final Color borderColor;
  final Color fontColor;
  final Function onTap;
  final Widget child;

  const ButtonLoginAnimation(
      {Key key,
      this.label,
      this.background,
      this.borderColor,
      this.fontColor,
      this.onTap,
      this.child})
      : super(key: key);

  @override
  _ButtonLoginAnimationState createState() => _ButtonLoginAnimationState();
}

class _ButtonLoginAnimationState extends State<ButtonLoginAnimation>
    with TickerProviderStateMixin {
  AnimationController _positionController;
  Animation<double> _positionAnimation;

  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool _isLogin = false;
  bool _isIconHide = false;

  @override
  void initState() {
    super.initState();

    _positionController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _positionAnimation =
        Tween<double>(begin: Get.width/2, end: 320) .animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _scaleController.forward();
              setState(() {
                _isIconHide = true;
              });
            }
          });

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 32).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Get.off(widget.child, transition: Transition.fade);
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: widget.fontColor,
      highlightColor: widget.fontColor,
      splashColor: widget.fontColor,
      onTap: () {
        print(SizeConfig.screenWidth);
        print(SizeConfig.screenHeight);
        print(SizeConfig.textFactor);
        print(Get.width);
        setState(() {
          _isLogin = true;
        });
        _positionController.forward();
      },
      child: Container(
        height: getHeight(63),
        width: Get.width,
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(14),
        ),
        child: !_isLogin
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_forward_ios, color: widget.borderColor, size: getText(32))
                ],
              )
            : Stack(
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _positionController,
                    builder: (context, child) => Positioned(
                      left: _positionAnimation.value,
                      top: 5,
                      child: AnimatedBuilder(
                        animation: _scaleController,
                        builder: (context, build) => Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Container(
                              height: getHeight(50),
                              width: getWidth(50),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: !_isIconHide
                                  ? Icon(Icons.arrow_forward_ios,
                                      color: widget.borderColor, size: getText(32))
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: widget.borderColor,
                                          shape: BoxShape.circle),
                                          
                                    ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

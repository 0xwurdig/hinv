import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hinv/Screens/homePage.dart';
import 'package:hinv/components/gen.dart';
import 'package:hinv/size_config.dart';

import 'Screens/lockScreen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations( 
    [DeviceOrientation.portraitUp]);
  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              builder: (context, child) {
                return ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: child,
                );
              },
              theme: ThemeData(
                primarySwatch: generateMaterialColor(Color(0xFF1E212A)),
                accentColor: Colors.transparent,
              ),
              debugShowCheckedModeBanner: false,
              home: LockScreen(),
            );
          },
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

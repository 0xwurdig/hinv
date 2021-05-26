import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/Screens/Cart/cartItem.dart';
import 'package:hinv/Screens/Items/itemListPage.dart';
import 'package:hinv/components/Tiles/emp.dart';
import 'package:hinv/components/Tiles/item.dart';
import 'package:hinv/components/models/cartItemM.dart';
import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/size_config.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

int total() {
  int a = 0;
  if (cart_list.length == 0) {
    return 0;
  }
  for (int i = 0; i < cart_list.length; i++) {
    if (cart_list[i].quantity < 0) {
      a = a;
    } else {
      a = a + cart_list[i].quantity * cart_list[i].item.price;
    }
  }
  return a;
}

class _CartPageState extends State<CartPage> {
  Future<void> _pickImage() async {
    final selected = await ImagePicker().getImage(source: ImageSource.camera);
    if (selected != null) {
        _cropImage(selected);
      } else {
        print('No image selected.');
      }
  }

  Future<void> _cropImage(var image) async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        androidUiSettings: AndroidUiSettings(
            toolbarColor: Color(0xFFD4B132),
            toolbarTitle: 'Crop',
            toolbarWidgetColor: Colors.white));
    setState(() {
      if (cropped!= null) {
        _receipt = File(cropped.path);
      } else {
        print('No image selected.');
      }
    });
  }

  File _receipt;
  int _counter = 0;
  int to = total();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4B132),
      // bottomNavigationBar:
      // Container(
      // padding: EdgeInsets.symmetric(
      //   vertical: getWidth(15),
      //   horizontal: getWidth(30),
      // ),
      // // height: 174,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(getWidth(30)),
      //     topRight: Radius.circular(getWidth(30)),
      //   ),
      //   boxShadow: [
      //     BoxShadow(
      //       offset: Offset(0, -getWidth(15)),
      //       blurRadius: getWidth(20),
      //       color: Color(0xFFDADADA).withOpacity(0.15),
      //     )
      //   ],
      // ),
      // child: SafeArea(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             padding: EdgeInsets.all(10),
      //             height: getWidth(40),
      //             width: getWidth(40),
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF5F6F9),
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: SvgPicture.asset("assets/images/bill.svg"),
      //           ),
      //           Spacer(),
      //           Text("Add voucher code"),
      //           SizedBox(width: getWidth(10)),
      //           Icon(
      //             Icons.arrow_forward_ios,
      //             size: 12,
      //             color: Colors.white,
      //           )
      //         ],
      //       ),
      //       SizedBox(height: getHeight(20)),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text.rich(
      //             TextSpan(
      //               text: "Total:\n",
      //               children: [
      //                 TextSpan(
      //                   text: "\$337.15",
      //                   style: TextStyle(fontSize: 16, color: Colors.black),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             width: getWidth(190),
      //             child: TextButton(
      //               child: Text("Check Out"),
      //               onPressed: (){},
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: getHeight(10), bottom: getHeight(20)),
          height: getHeight(550),
          width: Get.width,
          decoration: BoxDecoration(
              color: Color(0xFF1E212A),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36))),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getHeight(20), horizontal: getWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: getWidth(7), vertical: getHeight(7)),
                  //   height: getHeight(60),
                  //   width: getWidth(60),
                  //   child: SvgPicture.asset('assets/images/menu.svg'),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: getText(35),
                    ),
                  ),

                  Text(
                    "Cart",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: getText(38),
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text.rich(TextSpan(
                          text: "x",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: getText(18),
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text: cart_list.length.toString(),
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: getText(30),
                                    fontWeight: FontWeight.w600)),
                          ]))),
                ],
              ),
            ),

            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((getWidth(17))),
                  ),
                  child: cart_list.length != 0
                      ? ListView.builder(
                          itemCount: cart_list.length,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: (index + _counter) % 2 == 0
                                  ? Alignment.centerRight
                                  : Alignment(-0.3, 0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getHeight(10)),
                                child: Dismissible(
                                  movementDuration: Duration(milliseconds: 100),
                                  resizeDuration: Duration(milliseconds: 100),
                                  key: Key(cart_list[index].item.id.toString()),
                                  direction: DismissDirection.horizontal,
                                  onDismissed: (direction) {
                                    setState(() {
                                      Get.snackbar("Item Removed",
                                          "${cart_list[index].item.name}",
                                          backgroundColor: Color(0xFFD4B132)
                                              .withOpacity(0.7));
                                      _counter++;
                                      cart_list.removeAt(index);
                                    });
                                  },
                                  background: Container(
                                    width: getWidth(350),
                                    height: getHeight(120),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getWidth(20)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(getWidth(20)),
                                          topRight:
                                              Radius.circular(getWidth(20))),
                                    ),
                                    child:
                                        // Icon(Icons.delete, color: Colors.white,)
                                        Row(
                                      children: [
                                        Spacer(),
                                        Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  child: CartI(item: cart_list[index]),
                                ),
                              ),
                            );
                          })
                      : Container(
                          child: Column(children: [
                          SvgPicture.asset(
                            'assets/images/empa.svg',
                            height: getHeight(280),
                            width: getWidth(300),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text.rich(TextSpan(
                                  text: "Your Cart is ",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: getText(24),
                                      fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                        text: "Empty \n",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: getText(24),
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic)),
                                    TextSpan(
                                        text: "Add Items to get Started",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: getText(18),
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ]))),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Get.to(ItemListPage());
                            },
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                alignment: Alignment.center,
                                height: getHeight(70),
                                width: getWidth(300),
                                decoration: BoxDecoration(
                                    color: Color(0xFFD4B132),
                                    borderRadius:
                                        BorderRadius.circular(getWidth(12))),
                                child: Text(
                                  "Browse Items Page",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: getText(28),
                                      // fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ),
                        ]))),
            ),

            // EmployeeTile(empList[0]),
            // EmployeeTile(empList[0]),
            // EmployeeTile(empList[0]),
            // EmployeeTile(empList[0]),
            // EmployeeTile(empList[0]),
          ]),
        ),
        cart_list.length != 0
            ? Container(
                height: Get.height - getHeight(550),
                width: Get.width,
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(10)),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(bottom: getHeight(10)),
                    child: Text('__________',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: getText(18),
                            fontWeight: FontWeight.w900)),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _receipt == null
                                ? Container(
                                  height: getHeight(35),
                                  width: getWidth(170),
                                  child: GestureDetector(
                                      onTap: () {
                                        _pickImage();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                getWidth(17)),
                                            border:
                                                Border.all(color: Colors.white)),
                                        child: Center(
                                          child: Text("Add Receipt",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontSize: getText(15),
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                    ),
                                )
                                : Container(
                                  height: getHeight(35),
                                  width: getWidth(170),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(ImageView(image: _receipt,));
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getWidth(17)),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text("Reciept",
                                                    // _receipt.path.split('/').last,
                                                    style: TextStyle(
                                                        fontFamily: 'Montserrat',
                                                        color: Color(0xFFD4B132),
                                                        fontSize: getText(17),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _receipt = null;
                                              });
                                            },
                                          )
                                        ]),
                                ),
                            SizedBox(height: getHeight(10)),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text.rich(TextSpan(
                                    text: "Total : ",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: getText(24),
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                          text:
                                              "\u{20B9} " + total().toString(),
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: getText(24),
                                              fontWeight: FontWeight.w600)),
                                    ]))),
                          ],
                        ),
                        Container(
                          height: getHeight(70),
                          width: getWidth(180),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getWidth(17)),
                              color: Colors.black),
                          child: Center(
                            child: Text('Add',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: getText(26),
                                    fontWeight: FontWeight.w400)),
                          ),
                        )
                      ]),
                ]),
              )
            : Container(
                height: Get.height - getHeight(550),
                width: Get.width,
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    bottom: getHeight(10)),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(bottom: getHeight(10)),
                    child: Text('__________',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: getText(18),
                            fontWeight: FontWeight.w900)),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(bottom: getHeight(10)),
                  //   child: Text('. . . . . . .',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontFamily: 'Montserrat',
                  //           color: Colors.white,
                  //           fontSize: getText(18),
                  //           fontWeight: FontWeight.w900)),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.only(bottom: getHeight(10)),
                  //   child: Text('. . . . .',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontFamily: 'Montserrat',
                  //           color: Colors.white,
                  //           fontSize: getText(18),
                  //           fontWeight: FontWeight.w900)),
                  // ),
                  // Container(
                  //   child: Text('. . .',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontFamily: 'Montserrat',
                  //           color: Colors.white,
                  //           fontSize: getText(18),
                  //           fontWeight: FontWeight.w900)),
                  // ),
                ]),
              )
      ]),
    );
  }
}

// Container empListBuilder(){
//   return Container(
//     child: Column(children: [
//               EmployeeTileAnimation(empList[0]),
//               EmployeeTileAnimation(empList[0]),
//               EmployeeTileAnimation(empList[0]),
//               EmployeeTileAnimation(empList[0]),
//               EmployeeTileAnimation(empList[0]),
//               // EmployeeTile(empList[0]),
//               // EmployeeTile(empList[0]),
//               // EmployeeTile(empList[0]),
//               // EmployeeTile(empList[0]),
//               // EmployeeTile(empList[0]),
//             ]),
//   );
// }
class ImageView extends StatefulWidget {
  final File image;
  ImageView({this.image});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      imageProvider: AssetImage(widget.image.path),
    ));
  }
}

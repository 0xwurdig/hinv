import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hinv/bottomSheets/addToInventory.dart';
import 'package:hinv/components/Tiles/addItem.dart';
import 'package:hinv/components/models/itemM.dart';
import 'package:hinv/bottomSheets/reqItem.dart';
import 'package:hinv/components/Tiles/emp.dart';
import 'package:hinv/components/Tiles/item.dart';
import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/size_config.dart';
import 'package:intl/intl.dart' as intl;

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  List<Item> itemsFiltered = [];
   TextEditingController searchController = new TextEditingController();
  @override
  void initState(){
    super.initState();
    searchController.addListener(() {
        filterItems();
        print(itemsFiltered);
      });
  }
   filterItems() {
    List<Item> _items = [];
    _items.addAll(listitem);
    if (searchController.text.isNotEmpty) {
      _items.retainWhere((item) {
        String searchTerm = searchController.text.toLowerCase();
        String itemName = item.name.toLowerCase();
        bool nameMatches = itemName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }
        String itemSize = item.size.toLowerCase();
        bool sizeMatches = itemSize.contains(searchTerm);
        if (sizeMatches == true) {
          return true;
        }
        
      });
    }
    setState(() {
      itemsFiltered = _items;
    });
  }
  bool _folded = true;
  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty; 
    return Scaffold(
      backgroundColor: Color(0xFF764358),
      // Color(0xFF1E212A),

      body: SingleChildScrollView(
              child: Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: getHeight(10), bottom: getHeight(20)),
              height: getHeight(550),
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(0xFF1E212A),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(getWidth(36)),
                      bottomRight: Radius.circular(getWidth(36)))),
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
                        "Add Items",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: getText(38),
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(ReqItem());
                        },
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: getText(37),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: getHeight(20)),
                  child: Container(
                    // color: Colors.red,
                    color: Color(0xFF1E212A),
                    width: Get.width,
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        width: _folded ? getWidth(56) : getWidth(360),
                        height: getWidth(56),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getWidth(32)),
                          color: Colors.white.withOpacity(0.2),
                          boxShadow: kElevationToShadow[5],
                        ),
                        child: Row(children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: getWidth(16)),
                              child: !_folded
                                  ? TextFormField(
                                    controller: searchController,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: getText(24),
                                          fontWeight: FontWeight.w400),
                                      decoration: InputDecoration(
                                          hintText: 'Search',
                                          hintStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: getText(24),
                                              fontWeight: FontWeight.w400),
                                          border: InputBorder.none),
                                    )
                                  : null,
                            ),
                          ),
                          Container(
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      _folded ? getWidth(32) : getHeight(0)),
                                  topRight: Radius.circular(getWidth(32)),
                                  bottomLeft: Radius.circular(
                                      _folded ? getWidth(32) : getHeight(0)),
                                  bottomRight: Radius.circular(getWidth(32)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getWidth(16),
                                      vertical: getHeight(16)),
                                  child: Icon(
                                    _folded ? Icons.search : Icons.close,
                                    color: Colors.white,
                                    size: getText(23),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    searchController.clear();
                                    _folded = !_folded;
                                  });
                                },
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),

                Container(
                  clipBehavior: Clip.hardEdge,
                      height: getWidth(350),
                      width: getWidth(350),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getWidth(17)),
                    ),
                    child: ListView.builder(
                          itemCount: isSearching == true ? itemsFiltered.length : listitem.length,
                          itemBuilder: (context, index) {
                            Item item = isSearching == true ? itemsFiltered[index] : listitem[index];
                            return GestureDetector(
                              onTap: (){
                                Get.bottomSheet(AddToInventory(item));
                              },
                              child: AddItemCard(item));
                          }),
                    ),

                // EmployeeTileAnimation(empList[0]),
                // EmployeeTileAnimation(empList[0]),
                // EmployeeTileAnimation(empList[0]),
                // EmployeeTileAnimation(empList[0]),
                // EmployeeTileAnimation(empList[0]),
                // EmployeeTile(empList[0]),
                // EmployeeTile(empList[0]),
                // EmployeeTile(empList[0]),
                // EmployeeTile(empList[0]),
                // EmployeeTile(empList[0]),
              ]),
            ),
            Container(
              child: Text('__________',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: getText(18),
                      fontWeight: FontWeight.w900)),
            ),
            SizedBox(height: getHeight(30)),
            Align(
              alignment: Alignment.center,
              child: Text(
                '...',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white.withOpacity(0.7),
                    fontSize: getText(50),
                    fontWeight: FontWeight.w700),
              ))
          ]),
        ),
      ),
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

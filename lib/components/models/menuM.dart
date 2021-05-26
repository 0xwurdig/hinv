class Menu{
  String title;
  String desc;
  String color;
  String img;
  Menu({this.color,this.desc,this.img,this.title});
}

List<Menu> mList = [
  Menu(
    title: "Employees",
    desc: "Maintaining your inventory at its best",
    color: "0xFF44539F",
    img:"assets/images/emp.svg"
  ),
  Menu(
    title: "Transactions",
    desc: "Where your stuff goes to and comes from",
    color: "0xFF0C7878",
    img:"assets/images/bill.svg"
  ),
  Menu(
    title: "Items",
    desc: "What's in your inventory?",
    color: "0xFF764358",
    img:"assets/images/items.svg"
  ),
  // Menu(
  //   title: "Report",
  //   desc: "Have the PaperWork for your inventory on go!",
  //   color: "0xFFD4B132",
  //   img:"assets/images/report.svg"
  // ),
];
import 'package:hinv/components/models/itemM.dart';

class CartItem {
  Item item;
  int quantity;
  String desc;
  CartItem({this.desc,this.item,this.quantity});
}

List<CartItem> cart_list = [
  CartItem(desc: "asdasdasdsadasdsadasdasdasdasdasdasdasdasdsadadsadsadasdsadas",item: Item(name: "Bearing",id: "asdaswaswfasw",price: 120,quantity: 200,total: 300,size: "304050"),quantity: -20),
  CartItem(desc: "asdasdasdsadasdsadasdasdasdasdasdasdasdasdsadadsadsadasdsadas",item: Item(name: "Bearing",id: "asdaswaasdwadawdsswfasw",price: 120,quantity: 200,total: 300,size: "304050"),quantity: 20),
  CartItem(desc: "asdasdasdsadasdsadasdasdasdasdasdasdasdasdsadadsadsadasdsadas",item: Item(name: "Bearing",id: "asdaswaasdwadawdsswfw",price: 120,quantity: 200,total: 300,size: "304050"),quantity: 20),
  CartItem(desc: "asdasdasdsadasdsadasdasdasdasdasdasdasdasdsadadsadsadasdsadas",item: Item(name: "Bearing",id: "asdaswwdsswfasw",price: 120,quantity: 200,total: 300,size: "304050"),quantity: 20),
  CartItem(desc: "asdasdasdsadasdsadasdasdasdasdasdasdasdasdsadadsadsadasdsadas",item: Item(name: "Bearing",id: "asdaswaasdwadawdssw",price: 120,quantity: 200,total: 300,size: "304050"),quantity: 20),
];
// List<CartItem> cart_list = [
//   CartItem(desc: "asdasdasdsadasdsadasdasdasdasdasdasdasdasdsadadsadsadasdsadas",item: Item(name: "Bearing",id: "asdaswaswfasw",price: 120,quantity: 200,total: 300,size: "304050"),quantity: -20),
//   CartItem(desc: "asdasdasdsadasdsadasdasdasdasdasdasdasdasdsadadsadsadasdsadas",item: Item(name: "Bearing",id: "asdaswaasdwadawdsswfasw",price: 120,quantity: 200,total: 300,size: "304050"),quantity: 20),
// ];
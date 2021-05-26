import 'package:hinv/components/models/employeeM.dart';
import 'package:hinv/components/models/itemM.dart';

class Transaction{
  List<Item> itemList;
  String id;
  int amount;
  String time;
  String type;
  Employee employee;
  String desc;
  Transaction({this.amount,this.id,this.itemList,this.time,this.type,this.employee, this.desc});
}

List<Transaction> transactionList = [
  Transaction(
    amount: 12001,
    id: "a21e1dsacasf",
    itemList: [
      Item(name: "asdwad", price: 121, quantity: 1,total: 120,unit: "packet of 10pc"  )
    ],
    time: "Today",
    type: "in",
    employee: Employee(
      doj: "asdsad",
      id: "asdsadsadasdasasdaada",
      nOftransactions: 68,
      name: "Rahul Kumar",
    )
  ),
  Transaction(
    amount: 12002,
    id: "a21e1dsacasf",
    itemList: [
      Item(name: "aswad", price: 122, quantity: 1,total: 120,unit: "pkt[10]"  ),
      Item(name: "asdwad", price: 3123, quantity: 1,total: 120,unit: "pkt[10]"  ),
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "pkt[10]"  ),
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "pkt[10]"  ),
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "pkt[10]"  ),
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "pkt[10]"  ),
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "pkt[10]"  ),
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "pkt[10]"  ),
    ],
    time: "Today",
    type: "in",
    employee: Employee(
      doj: "asdsad",
      id: "asdsadsadasdasasdaada",
      nOftransactions: 68,
      name: "Rahul Kumar",
    )
  ),
  Transaction(
    amount: 3,
    id: "a21e1dsacasf",
    itemList: [
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "10/pkt"  )
    ],
    time: "Today",
    type: "in",
    employee: Employee(
      doj: "asdsad",
      id: "asdsadsadasdasasdaada",
      nOftransactions: 68,
      name: "Rahul Kumar",
    )
  ),
  Transaction(
    amount: 12040,
    id: "a21e1dsacasf",
    itemList: [
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "packet of 10pc"  )
    ],
    time: "Today",
    employee: Employee(
      doj: "asdsad",
      id: "asdsadsadasdasasdaada",
      nOftransactions: 68,
      name: "Rahul Kumar",
    ),
    type: "in"
  ),
  Transaction(
    amount: 12040,
    id: "a21e1dsacasf",
    itemList: [
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "packet of 10pc"  )
    ],
    time: "Today",
    employee: Employee(
      doj: "asdsad",
      id: "asdsadsadasdasasdaada",
      nOftransactions: 68,
      name: "Rahul Kumar",
    ),
    type: "out"
  ),
  Transaction(
    amount: 12040,
    id: "a21e1dsacasf",
    itemList: [
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "packet of 10pc"  )
    ],
    time: "Today",
    employee: Employee(
      doj: "asdsad",
      id: "asdsadsadasdasasdaada",
      nOftransactions: 68,
      name: "Rahul Kumar",
    ),
    type: "in"
  ),
  Transaction(
    amount: 12040,
    id: "a21e1dsacasf",
    itemList: [
      Item(name: "asdwad", price: 120, quantity: 1,total: 120,unit: "packet of 10pc"  )
    ],
    time: "Today",
    employee: Employee(
      doj: "asdsad",
      id: "asdsadsadasdasasdaada",
      nOftransactions: 68,
      name: "Rahul Kumar",
    ),
    type: "out"
  )
];
import 'package:hinv/components/models/transactionM.dart';

class Employee{
  String id;
  String name;
  String doj;
  int nOftransactions;
  List<Transaction> transactions; 
  String lastSeen;
  int phn;

  Employee({this.doj,this.id,this.nOftransactions,this.name,this.transactions,this.lastSeen, this.phn});
}

List<Employee> empList = [
 Employee(
      doj: "asdsad",
      id: "asdsadsadasdasasdaada",
      nOftransactions: 68,
      name: "Rahul Kumar",
      lastSeen: "Today 5:30",
      phn: 9031808450
    ),
];
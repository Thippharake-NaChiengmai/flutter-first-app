import 'package:firstapp/pages/calculate.dart';
import 'package:flutter/material.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  final items = List<String>.generate(1000, (i) => "Item $i");
  List myData = ["apple", "banana", "papaya"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)
              =>const CalculatePage()),
            );
          },
          leading: FlutterLogo(),
          title: Text(myData[index]),
        );
      },
      itemCount: myData.length,
    );
  }
}

import 'package:flutter/material.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              Text("Thippharake Na Ciengmai"),
              Text("Code: 662115019"),
              Text("Mobile App Development"),
              Text("Room: LC-B205")
            ]
          ),
        )
      ],
    );
  }
}

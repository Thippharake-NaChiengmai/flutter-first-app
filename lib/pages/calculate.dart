import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  double _total = 0;
  double _change = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "change Calculation",
              style: TextStyle(
                fontFamily: "maaja",
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple,
                backgroundColor: Colors.pinkAccent,
              ),
            ),
            SizedBox(height: 10),
            Image.asset('images/sony-ps5-pro-001.jpg', width: 150, height: 100),
            SizedBox(height: 10),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxtcsfDVxrshmLdIRMb7_hmYfcu__KXhsynQ&s',
              width: 100,
              height: 50,
            ),
            priceTextField(),
            amoutTextField(),
            calculateButton(),
            showTotalText(),
            receiveMoneyTextField(),
            changeCalculateButton(),
            showChangeText(),
          ],
        ),
      ),
    );
  }
  Widget priceTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: price,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Price per item',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget amoutTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: amount,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Amount of items',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget calculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (price.text.isNotEmpty && amount.text.isNotEmpty) {
            setState(() {
              _total = double.parse(amount.text) - double.parse(price.text);
            });
            if (double.parse(price.text) > double.parse(amount.text)) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('money is not enough')));
            }
          }
        },
        child: Text('Calculate Total'),
      ),
    );
  }

  Widget receiveMoneyTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: change,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Get Money',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget showTotalText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("total : ${_total.toStringAsFixed(2)} ฿"),
    );
  }

  Widget changeCalculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (change.text.isNotEmpty) {
            if (double.parse(change.text) < _total) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('money is not enough')));
              setState(() {
                _change = 0;
              });
            } else {
              setState(() {
                _change = double.parse(change.text) - _total;
              });
            }
          }
        },
        child: Text('Calculate Change'),
      ),
    );
  }

  Widget showChangeText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("change : ${_change.toStringAsFixed(2)} ฿"),
    );
  }
}

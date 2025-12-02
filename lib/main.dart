import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thippharake Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Thippharake Shop Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  double _total = 0;
  double _change = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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
                background: Paint()..color = Color.fromARGB(255, 231, 93, 112),
              ),
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

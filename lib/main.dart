import 'package:firstapp/pages/home.dart';
import 'package:firstapp/pages/contract.dart';
import 'package:firstapp/pages/calculate.dart';
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

  int _currentIndex = 0;
  final tabs =[HomePage(),CalculatePage(),ContractPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
          body: tabs[_currentIndex], bottomNavigationBar:
          BottomNavigationBar(currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.contact_mail),label: 'Contract'),
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.calculate),label: 'Calculate')
            ],),
    );
  }
}

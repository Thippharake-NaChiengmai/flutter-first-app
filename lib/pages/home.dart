import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
      myBox(),
      SizedBox(height: 10),
      myBox(),
      SizedBox(height: 10),
      myBox()
      ],
    );
  }
  Widget myBox() {
    return Container(
      padding: EdgeInsets.all(24),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(image:NetworkImage("https://i.pinimg.com/736x/67/56/95/6756956ec2e5b6b569b23110696a4ee7.jpg"),
            fit: BoxFit.cover),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What is a Computer" ,style: TextStyle(fontSize: 25, color: Colors.white)),
          Text("Computer is an electronic device that processes data and performs a wide range of tasks by following a set of instructions, typically referred to as programs or software. It can execute complex calculations, store and retrieve data, and perform tasks like word processing, gaming, web browsing, data analysis, and much more."
              ,style: TextStyle(fontSize: 15, color: Colors.white))
    ],),
        );

  }
}

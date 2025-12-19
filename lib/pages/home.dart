import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Computer & App Development Knowledge.",style: TextStyle(fontSize:15)),
      ),
        body: Padding(
            padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            myBox("What is a Computer?",
                  "Computer is an electronic device that processes data and performs a wide range of tasks by following a set of instructions, typically referred to as programs or software. It can execute complex calculations, store and retrieve data, and perform tasks like word processing, gaming, web browsing, data analysis, and much more.",
                  "https://i.pinimg.com/736x/67/56/95/6756956ec2e5b6b569b23110696a4ee7.jpg"
            ),
            SizedBox(height: 20),
            myBox("What is a Flutter?",
                  "Flutter is an open-source UI software development kit (SDK) created by Google. It allows developers to build natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase.",
                  "https://i.pinimg.com/736x/c5/e1/44/c5e14464850d0d3b59c9e1cbb5ee9053.jpg"
            ),
            SizedBox(height: 20),
            myBox("What is a Dart?",
                  "Dart is a client-optimized, object-oriented programming language created by Google. While it can be used for backend (server) development, it is most famous today for being the programming language used to build Flutter applications.",
                  "https://i.pinimg.com/736x/83/53/8a/83538ac2864c7c0a3186616c7d8d20f9.jpg"
            )
          ],
          )
        )
    );
  }
  Widget myBox(String title, String subTitle, String img_url) {
    return Container(
      padding: EdgeInsets.all(24),
      height: 275,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(image:NetworkImage(img_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
        ),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ,style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(subTitle ,style: TextStyle(fontSize: 15, color: Colors.white))
    ],
      ),
        );

  }
}

import 'package:firstapp/pages/details.dart';
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
                  "Computer is an electronic device that processes data and performs a wide range of tasks by following a set of instructions, typically referred to as programs or software.",
                  "https://i.pinimg.com/736x/67/56/95/6756956ec2e5b6b569b23110696a4ee7.jpg",
                  "A computer is a programmable electronic device designed to manipulate information or data by following specific sets of instructions called software. It functions by accepting raw data as input, processing it through a central processing unit (CPU) to perform arithmetic and logical operations, and then producing the result as output or storing it for future use. Because they can be programmed to handle a vast array of different tasks, computers are versatile tools essential for everything from simple calculations and word processing to complex scientific simulations and global communication."
            ),
            SizedBox(height: 20),
            myBox("What is a Flutter?",
                  "Flutter is an open-source UI software development kit (SDK) created by Google. It allows developers to build natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase.",
                  "https://i.pinimg.com/736x/c5/e1/44/c5e14464850d0d3b59c9e1cbb5ee9053.jpg",
                  "Flutter is an open-source UI (User Interface) toolkit created by Google. It allows developers to build natively compiled applications for mobile, web, and desktop from a single codebase.Language: It uses the Dart programming language.Key Feature: It is famous for its `Hot Reload` feature, which lets developers see changes on the screen almost instantly without restarting the app.Why use it: Instead of writing separate code for an iPhone app (Swift) and an Android app (Kotlin), you write one set of code in Flutter that works on both."
            ),
            SizedBox(height: 20),
            myBox("What is a Dart?",
                  "Dart is a client-optimized, object-oriented programming language created by Google. While it can be used for backend (server) development, it is most famous today for being the programming language used to build Flutter applications.",
                  "https://i.pinimg.com/736x/83/53/8a/83538ac2864c7c0a3186616c7d8d20f9.jpg",
                  "Dart is a client-optimized programming language developed by Google, best known as the foundation for the Flutter framework. Designed for building fast, high-performance applications on any platform, it features a syntax familiar to developers of C# or Java and supports both Ahead-of-Time (AOT) compilation for production speed and Just-in-Time (JIT) compilation for rapid development cycles like `Hot Reload.` Because it compiles directly to native machine code for mobile and desktop, or JavaScript for the web, Dart enables developers to create smooth, consistent user experiences across multiple devices from a single codebase."
            )
          ],
          )
        )
    );
  }
  Widget myBox(String title, String subTitle, String img_url, String description) {
    return Container(
      padding: EdgeInsets.all(24),
      height: 290,
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
          SizedBox(height: 15),
          Text(subTitle ,style: TextStyle(fontSize: 15, color: Colors.white)),
          SizedBox(height: 15),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(
              title: title,
              img_url: img_url,
              description: description,
            )
              )
                );
            },
              child: Text("Read More>>", style: TextStyle(color: Colors.white)),
              )
    ],
      ),
        );

  }
}

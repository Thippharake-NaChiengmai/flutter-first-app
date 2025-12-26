import 'dart:convert';

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
        title: Text("Computer & App Development Knowledge.",style: TextStyle(fontSize:18)),
      ),
        body: Padding(
            padding: const EdgeInsets.all(20),
              child: FutureBuilder(
                builder: (context, snapshot) {
                  var data = jsonDecode(snapshot.data.toString());
                  return ListView.builder(itemBuilder: (BuildContext context, int index ){
                    return myBox(data[index]['title'], data[index]['subTitle'], data[index]['img_url'], data[index]['description']);
                  },
                    itemCount: data.length,);
                  },
                future: DefaultAssetBundle.of(context).loadString("assets/json/data.json"),)
        ));
  }
  Widget myBox(String title, String subTitle, String img_url, String description) {
    return Container(
      margin: EdgeInsets.only(top: 20),
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
              child: Text("Read More>>", style: TextStyle(color: Colors.blueAccent)),
              )
    ],
      ),
        );

  }
}

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
                    return myBox(data[index]['title'], data[index]['subTitle'], data[index]['img_url'], data[index]['details']);
                  },
                    itemCount: data.length,);
                  },
                future: DefaultAssetBundle.of(context).loadString("assets/json/data.json"),)
        ));
  }
  Widget myBox(String title, String subTitle, String img_url, String details) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subTitle;
    v3 = img_url;
    v4 = details;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(24),
      height: 288,
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(v1, v2, v3, v4)
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

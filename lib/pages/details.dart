import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String img_url;
  final String description;

  const DetailsPage(
      {super.key,
        required this.title,
        required this.img_url,
        required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
        body: ListView(
          children: [
            Image.network(img_url, fit: BoxFit.cover),
            Padding(padding: EdgeInsets.all(20.0),
              child: Text(description, style: TextStyle(fontSize: 18)
              ),
            ),
          ],
        )
    );
  }
}

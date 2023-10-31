import 'package:flutter/material.dart';

class FeedElement extends StatelessWidget {
  String heading = "White pony";
  String subheading = "Deftones";
  String imagePath = "";
  String user = "curti666";
  String review = "";

  FeedElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [/*Image.asset(""),*/ Container()],
      ),
    );
  }
}

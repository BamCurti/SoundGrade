import 'package:flutter/material.dart';

class FeedElement extends StatelessWidget {
  final String heading = "White pony";
  final String subheading = "Deftones";
  final String imagePath = "";
  final String user = "curti666";
  final String review = "";

  const FeedElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [/*Image.asset(""),*/ Container()],
      ),
    );
  }
}

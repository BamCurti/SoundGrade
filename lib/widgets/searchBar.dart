import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 15.0), // Adjust horizontal margin for width
      padding: EdgeInsets.only(
          top: 2.0, bottom: 2.0), // Adjust top and bottom padding for height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(null),
          suffixIcon: Icon(Icons.search, color: Colors.black),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

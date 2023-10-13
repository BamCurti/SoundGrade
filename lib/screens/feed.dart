import 'package:flutter/material.dart';
import 'package:soundgrade/widgets/songCard.dart';
import 'package:soundgrade/screens/dummyData_feed.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 103, 28, 112),
      ),
      body: ListView.builder(
          itemCount: dummySongsInfo.length,
          itemBuilder: (BuildContext context, int index) {
            return SongCard(songInfo: dummySongsInfo[index]);
          }),
    );
  }
}

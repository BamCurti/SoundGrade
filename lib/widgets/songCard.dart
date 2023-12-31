import 'package:flutter/material.dart';
import 'package:soundgrade/screens/post.dart';
import 'package:soundgrade/data/songs.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/services/firebase/songs.dart';

class SongCard extends StatelessWidget {
  final Song songInfo;

  SongCard({required this.songInfo});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    SongInfoContainerStyle containerStyle = theme.brightness == Brightness.light
        ? lightSongInfoContainerStyle
        : darkSongInfoContainerStyle;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage(songInfo: songInfo),
          ),
        );
      },
      child: Card(
        color: theme.cardTheme.color,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: containerStyle.backgroundColor,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "User",
                    style: TextStyle(
                        color: containerStyle.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(" rated:",
                      style: TextStyle(
                        color: containerStyle.textColor,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Image.network(
              songInfo.imageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              songInfo.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.0),
                            Text('Artist: ${songInfo.artist.name}'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < songInfo.rating; i++)
                            Icon(Icons.favorite, color: Colors.red, size: 20.0),
                          for (var i = songInfo.rating; i < 5; i++)
                            Icon(Icons.heart_broken_outlined,
                                color: Colors.red, size: 20.0),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongList extends StatelessWidget {
  const SongList({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SongCollection.getList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No data available"),
          );
        } else {
          final data = snapshot.data;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return SongCard(songInfo: Song.fromJson(data[index]));
            },
          );
        }
      },
    );
  }
}

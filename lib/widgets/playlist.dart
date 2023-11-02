import 'package:flutter/material.dart';
import 'package:soundgrade/data/playlist.dart';
import 'package:soundgrade/screens/playlists.dart';
import 'package:soundgrade/utils/style.dart';

class PlaylistCard extends StatelessWidget {
  final PlayListData data;

  const PlaylistCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: mainColor, // Set the background color to purple
          borderRadius:
              BorderRadius.circular(10.0), // Optional: Add rounded corners
        ),
        child: Column(
          children: [
            Image.network(data.imageUrl, fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.name,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayListDetailPage(
                    data: data,
                  ))),
    );
  }
}

class PlayListDetailContainer extends StatelessWidget {
  const PlayListDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchSongListData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          // Successful fetch
          final data = snapshot.data!;
          return PlayListDetail(data: data[0]);
        });
  }
}

class PlayListDetail extends StatelessWidget {
  final PlayListData data;
  PlayListDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

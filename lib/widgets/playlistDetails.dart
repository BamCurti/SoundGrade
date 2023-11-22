import 'package:flutter/material.dart';
import 'package:soundgrade/data/playlist.dart';
import 'package:soundgrade/screens/playlists.dart';
import 'package:soundgrade/screens/profile.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/feed.dart';
import 'package:provider/provider.dart';
import 'package:soundgrade/utils/theme_notifier.dart';
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
          color: Color.fromARGB(172, 159, 198, 223),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Center(
              child: Image.network(data.imageUrl,
                  fit: BoxFit.cover, height: 230, width: 460),
            ),
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
              builder: (context) => PlayListDetail(
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
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(data.name),
            backgroundColor:
                themeNotifier.isLightMode ? mainColor : darkerMainColor,
          ),
          body: Column(
            children: [
              Image.network(data.imageUrl,
                  fit: BoxFit.cover, height: 230, width: 460),
              Divider(color: Colors.grey),
              Expanded(
                child: ListView.builder(
                  itemCount: data.songsId.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.music_video_sharp),
                          title: Text(
                            data.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(data.name),
                        ),
                        Divider(color: Colors.grey),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavbar(
            currentIndex: 1,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                  break;
                case 1:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                  break;
                case 2:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                  break;
                case 3:
                  break;
              }
            },
          ),
        );
      },
    );
  }
}

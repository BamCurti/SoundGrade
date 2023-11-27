import 'package:flutter/material.dart';
import 'package:soundgrade/screens/profile.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/widgets/searchBar.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/screens/feed.dart';
import 'package:soundgrade/widgets/playlistDetails.dart';
import 'package:soundgrade/data/playlist.dart';
import 'package:soundgrade/widgets/createPlaylistDialog.dart';
import 'package:provider/provider.dart';
import 'package:soundgrade/utils/theme_notifier.dart';
import 'package:soundgrade/utils/style.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor:
                themeNotifier.isLightMode ? mainColor : darkerMainColor,
            title: CustomSearchBar(),
          ),
          body: Column(
            children: [
              const Expanded(child: SongListFetcher()),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _showCreateListDialog(
                        context); // Call the function to show the dialog
                  },
                  child: Text('Create New List'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavbar(
            currentIndex: 1,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          MainPage(),
                      transitionDuration: Duration(milliseconds: 800),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(-1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ProfileTemporaryPage(),
                      transitionDuration: Duration(milliseconds: 800),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                  break;
                case 3:
                  break;
                default:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                  break;
              }
            },
          ),
        );
      },
    );
  }

  void _showCreateListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreateListDialog();
      },
    );
  }
}

class SongListFetcher extends StatelessWidget {
  const SongListFetcher({super.key});

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
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => PlaylistCard(data: data[index]));
        });
  }
}

import 'package:flutter/material.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/widgets/songCard.dart';
import 'package:soundgrade/widgets/searchBar.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/screens/profile.dart';
import 'package:soundgrade/screens/playlists.dart';
import 'package:provider/provider.dart';
import 'package:soundgrade/utils/theme_notifier.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

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
            actions: [
              IconButton(
                icon:
                    Icon(Icons.add, color: Colors.white), // Set the color here
                onPressed: () {
                  _showAddSongDialog(context);
                },
              ),
            ],
          ),
          body: SongList(),
          bottomNavigationBar: BottomNavbar(
            currentIndex: 0,
            onTap: (index) {
              switch (index) {
                case 0:
                  break;
                case 1:
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ListPage(),
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
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
              }
            },
          ),
        );
      },
    );
  }

  void _showAddSongDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Song'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Song'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Artist'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Image'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Add your logic to handle the data entered in the dialog
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

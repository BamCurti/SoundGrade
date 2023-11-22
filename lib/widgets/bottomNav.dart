import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/utils/theme_notifier.dart';

class BottomNavbar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        Color navBarBackgroundColor = themeNotifier.isLightMode
            ? mainColor // Use the light theme color
            : darkerMainColor; // Use the dark theme color
        return BottomNavigationBar(
          backgroundColor: navBarBackgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          currentIndex: widget.currentIndex,
          onTap: (index) {
            if (index == 3) {
              widget.onTap(index);
              themeNotifier.toggleTheme();
            } else {
              widget.onTap(index);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Playlists',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(themeNotifier.isLightMode
                  ? Icons.sunny
                  : Icons.nightlight_round), // Change the icon based on theme
              label: themeNotifier.isLightMode ? 'Light Mode' : 'Dark Mode',
            ),
          ],
        );
      },
    );
  }
}

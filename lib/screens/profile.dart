import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/widgets/searchBar.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/screens/feed.dart';
import 'package:soundgrade/screens/playlists.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/utils/theme_notifier.dart';
import 'package:soundgrade/utils/camera.dart';
import 'package:soundgrade/utils/theme_notifier.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CameraController? controller;
  String imagePath = "";

  void _showChangeDialog(String title, String hintText) {
    TextEditingController _textEditingController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Container(
              width: 300, // Set a fixed width for the dialog
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(color: Colors.grey),
                  TextFormField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: hintText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Add logic to save the new email/password
                String newEmailOrPassword = _textEditingController.text;
                // Add your save logic here

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

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
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 35),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          // Add logic for changing profile picture
                          try {
                            final image = await controller!.takePicture();
                            setState(() {
                              imagePath = image.path;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Text(
                  'Username',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  'user123@test.com',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 50),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      // Change Email Button
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            _showChangeDialog(
                                'Change Email', 'Enter new email');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.all(16),
                          ),
                          child: Center(
                            child: Text(
                              'Change Email',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      // Change Password Button
                      Container(
                        width: 150, // Set the desired width
                        child: ElevatedButton(
                          onPressed: () {
                            _showChangeDialog(
                                'Change Password', 'Enter new password');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.all(16),
                          ),
                          child: Center(
                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add logic for Log Out button
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            // Navigate to another screen when the button is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                              color: darktethememain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavbar(
            currentIndex: 2,
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
                default:
                  Navigator.pushReplacement(
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
}

class ProfileTemporaryPage extends StatelessWidget {
  const ProfileTemporaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(),
      actions: [
        SignedOutAction((context) {
          Navigator.of(context).pop();
        })
      ],
    );
  }
}

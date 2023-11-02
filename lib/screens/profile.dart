import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/widgets/searchBar.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/screens/feed.dart';
import 'package:soundgrade/screens/playlists.dart';
import 'package:soundgrade/utils/camera.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CameraController? controller;
  String imagePath = "";

  @override
  void initState() {
    var cameras = getCameras();
    // TODO: implement initState
    super.initState();
    controller = CameraController(cameras![1], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: mainColor,
        title: CustomSearchBar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 20),
            Text(
              'Username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'user123@test.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 50),
            // Settings Button
            ElevatedButton(
              onPressed: () {
                // Add logic for Settings button
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: SizedBox(
                width: 200,
                height: 50,
                child: Center(child: Text('Settings')),
              ),
            ),
            SizedBox(height: 20),
            // Change Email Button
            ElevatedButton(
              onPressed: () {
                // Add logic for Change Email button
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: SizedBox(
                width: 200,
                height: 50,
                child: Center(child: Text('Change Email')),
              ),
            ),
            SizedBox(height: 20),
            // Change Password Button
            ElevatedButton(
              onPressed: () {
                // Add logic for Change Password button
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: SizedBox(
                width: 200,
                height: 50,
                child: Center(child: Text('Change Password')),
              ),
            ),
            Spacer(), // Add spacer to push the logout button to the bottom
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
                    child: Text('Log Out'),
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
  }
}

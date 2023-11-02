import 'package:flutter/material.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/widgets/searchBar.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/screens/feed.dart';
import 'package:soundgrade/screens/profile.dart';
import 'package:soundgrade/screens/playlists.dart';
import 'package:soundgrade/data/songs.dart';
import 'package:soundgrade/widgets/playlist_dialog.dart';
import 'package:soundgrade/widgets/rate_dialog.dart';

class Review {
  final String profileImageUrl;
  final int rating;
  final String review;

  Review({
    required this.profileImageUrl,
    required this.rating,
    required this.review,
  });
}

class PostPage extends StatefulWidget {
  final Song songInfo;

  const PostPage({Key? key, required this.songInfo}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int selectedPlaylist = 2;
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth * 0.6;

    List<Review> reviews = [
      Review(
        profileImageUrl: 'assets/profile1.png',
        rating: 5,
        review: 'This song is amazing! Highly recommend.',
      ),
      Review(
        profileImageUrl: 'assets/profile2.png',
        rating: 4,
        review: 'Good song, but could be better.',
      ),
      Review(
        profileImageUrl: 'assets/profile3.png',
        rating: 3,
        review: 'Average song, nothing special.',
      ),
      Review(
        profileImageUrl: 'assets/profile4.png',
        rating: 2,
        review: 'Not a fan of this song.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: mainColor,
        title: CustomSearchBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              width: screenWidth,
              height: imageHeight,
              child: Image.asset(
                widget.songInfo.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.songInfo.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text('Artist: ${widget.songInfo.artist}'),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            for (var i = 0; i < widget.songInfo.rating; i++)
                              Icon(Icons.favorite,
                                  color: lightestPurple, size: 25.0),
                            for (var i = widget.songInfo.rating; i < 5; i++)
                              Icon(Icons.heart_broken_outlined,
                                  color: lightestPurple, size: 25.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      showDialog<int>(
                        context: context,
                        builder: (BuildContext context) {
                          return PlaylistDialogWidget();
                        },
                      ).then((selected) {
                        if (selected != null) {
                          print('Selected Playlist: $selected');
                          // Handle the selected playlist value as needed
                        }
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Write your review and rate...',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 30.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle the post action
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Rate this song'),
                                content:
                                    FavoriteIconsDialog(), // Calling the separate widget
                              );
                            },
                          );
                        },
                        child: Text('Post'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.grey,
              height: 1.0,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 8.0),
            ),
            // Display reviews as separate cards
            ...reviews.map((review) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color.fromARGB(255, 245, 251, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(review.profileImageUrl),
                              ),
                              SizedBox(width: 8.0),
                              Text('User Name'),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text('Rating: '),
                              for (var i = 0; i < review.rating; i++)
                                Icon(Icons.favorite,
                                    color: lightestPurple, size: 20.0),
                              for (var i = review.rating; i < 5; i++)
                                Icon(Icons.heart_broken_outlined,
                                    color: lightestPurple, size: 20.0),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(review.review),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 0,
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

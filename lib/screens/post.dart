import 'package:flutter/material.dart';
import 'package:soundgrade/widgets/songCard.dart';
import 'package:soundgrade/widgets/searchBar.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/dummyData_feed.dart';
import 'package:soundgrade/screens/rating.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/screens/feed.dart';
import 'package:soundgrade/screens/profile.dart';
import 'package:soundgrade/screens/playlists.dart';


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
  int? selectedPlaylist = 1;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'My Playlists',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Divider(),
                RadioListTile<int>(
                  title: Text('Playlist 1'),
                  value: 1,
                  groupValue: selectedPlaylist,
                  onChanged: (value) {
                    setState(() {
                      selectedPlaylist = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('Playlist 2'),
                  value: 2,
                  groupValue: selectedPlaylist,
                  onChanged: (value) {
                    setState(() {
                      selectedPlaylist = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('Playlist 3'),
                  value: 3,
                  groupValue: selectedPlaylist,
                  onChanged: (value) {
                    setState(() {
                      selectedPlaylist = value;
                    });
                  },
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 103, 28, 112),
        title: CustomSearchBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                            Text('Rating: ${widget.songInfo.rating}'),
                            Icon(Icons.star, color: Colors.yellow, size: 16.0),
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
                      _showDialog(context);
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
                            hintText: 'Write your review...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle the post action
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
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
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
                              Text(
                                  'User Name'), // You can replace this with the actual user's name
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text('Rating: ${review.rating}'),
                              Icon(Icons.star,
                                  color: Colors.yellow, size: 16.0),
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
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              break;
          }
        },
      ),
    );
  }
}

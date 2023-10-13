// ignore: file_names
class Song {
  final String title;
  final String artist;
  final int rating;
  final String imageUrl;

  Song({
    required this.title,
    required this.artist,
    required this.rating,
    required this.imageUrl,
  });
}

var dummySongsInfo = [
  Song
  (title: 'Song Title 1',
   artist: 'Artist 1', 
   rating: 4,
   imageUrl: 'lib/assets/images/thestrokes.jpg'
  ),
  // Add more songs as needed
];

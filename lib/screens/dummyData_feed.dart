// ignore: file_names
class Song {
  final String rater;
  final String title;
  final String artist;
  final int rating;
  final String imageUrl;

  Song({
    required this.rater,
    required this.title,
    required this.artist,
    required this.rating,
    required this.imageUrl,
  });
}

var dummySongsInfo = [
  Song(
      rater: 'Jessica99',
      title: 'Vision of Division',
      artist: 'The Strokes',
      rating: 5,
      imageUrl: 'lib/assets/images/thestrokes.jpg'),
  Song(
      rater: 'Curti232',
      title: 'Crying Lightning',
      artist: 'Arctic Monkeys',
      rating: 4,
      imageUrl: 'lib/assets/images/hub.png'),
  Song(
      rater: 'Mochi!!',
      title: 'PYT',
      artist: 'Michael Jackson',
      rating: 5,
      imageUrl: 'lib/assets/images/pyt.png'),
];

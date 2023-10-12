import 'dart:ffi';

class Rateable {
  final String name;
  final String author;
  final Float rating;
  final String imagePath;

  Rateable(
      {required this.name,
      required this.author,
      required this.rating,
      required this.imagePath});
}

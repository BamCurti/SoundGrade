import 'dart:ffi';
import 'package:soundgrade/data/user.dart';
import 'package:soundgrade/data/songs.dart';
import 'package:soundgrade/utils/json.dart';

const String rateablePath = 'assets/dummy/rateable.json';

class Rateable {
  final int rating;
  final String review;
  final String username;
  final String song;

  Rateable(
      {required this.rating,
      required this.review,
      required this.username,
      required this.song});

  factory Rateable.fromJson(Map<dynamic, dynamic> json) {
    try {
      return Rateable(
          review: json['review'] as String,
          rating: json['rating'] as int,
          username: json['username'] as String,
          song: json['song'] as String);
    } catch (e) {
      throw const FormatException();
    }
  }
}

Future<List<Rateable>> readDummyRateable() async {
  final rateables = await getJsonListData(rateablePath);
  return rateables.map((rateable) => Rateable.fromJson(rateable)).toList();
}

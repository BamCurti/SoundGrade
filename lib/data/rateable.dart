import 'package:soundgrade/utils/json.dart';

const String rateablePath = 'assets/dummy/rateable.json';

class Rateable {
  int rating;
  List<Rate>? rates;

  Rateable({
    this.rating = 0,
    this.rates,
  });
}

class Rate {
  final int rating;
  final String review;
  final String username;
  final String song;

  Rate(
      {required this.rating,
      required this.review,
      required this.username,
      required this.song});

  factory Rate.fromJson(Map<dynamic, dynamic> json) {
    try {
      return Rate(
          review: json['review'] as String,
          rating: json['rating'] as int,
          username: json['username'] as String,
          song: json['song'] as String);
    } catch (e) {
      throw const FormatException();
    }
  }
}

Future<List<Rate>> readDummyRateable() async {
  final rateables = await getJsonListData(rateablePath);
  return rateables.map((rateable) => Rate.fromJson(rateable)).toList();
}

import 'package:soundgrade/data/songs.dart';
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
  final String uuid;
  final int rating;
  final String review;
  final String rater;
  final Song song;

  Rate(
      {required this.uuid,
      required this.rating,
      required this.review,
      required this.rater,
      required this.song});

  factory Rate.fromJson(Map<dynamic, dynamic> json) {
    try {
      final String uuid = json["uuid"] as String;
      final String review = json["review"] as String;
      final int rating = json["rating"] as int;
      final String rater = json["rater"] as String;
      var songRaw = json["rateable"];
      return Rate(
        uuid: uuid,
        review: review,
        rating: rating,
        rater: rater,
        song: songRaw,
      );
    } catch (e) {
      throw const FormatException();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "review": review,
      "rating": rating,
      "rater": rater,
      "song": song.toJson(),
    };
  }
}

Future<List<Rate>> readDummyRateable() async {
  final rateables = await getJsonListData(rateablePath);
  return rateables.map((rateable) => Rate.fromJson(rateable)).toList();
}

const artistCollection = "artists";

class Artist {
  String name;
  String? imageUrl;
  String uuid;

  Artist({
    required this.name,
    this.imageUrl,
    required this.uuid,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    try {
      final name = json['name'];
      final uuid = json['uuid'];
      return Artist(name: name as String, uuid: uuid as String);
    } catch (e) {
      throw Error();
    }
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
    };
  }
}

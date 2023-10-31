class User {
  String username;
  String? imageUrl;
  String id;
  String email;

  User(
      {required this.username,
      this.imageUrl,
      required this.id,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    try {
      final username = json['username'];
      final id = json['id'];
      final email = json['email'];
      return User(
          username: username as String,
          id: id as String,
          email: email as String);
    } catch (e) {
      throw Error();
    }
  }
}

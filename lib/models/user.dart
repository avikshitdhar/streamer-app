// import 'dart:convert';

class User {
  final String uid;
  final String username;
  final String email;

  User({required this.uid, required this.username, required this.email});

  // Convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
    };
  }

  // Create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
    );
  }
}

// import 'dart:convert';

class Livestream {
  final String title;
  final String image;
  final String uid;
  final String username;
  final int viewers;
  final String channelId;
  final dynamic startedAt;

  Livestream({
    required this.title,
    required this.image,
    required this.uid,
    required this.username,
    required this.viewers,
    required this.channelId,
    required this.startedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'uid': uid,
      'username': username,
      'viewers': viewers,
      'channelId': channelId,
      'startedAt':
          startedAt is DateTime ? startedAt.toIso8601String() : startedAt,
    };
  }

  factory Livestream.fromJson(Map<String, dynamic> json) {
    return Livestream(
      title: json['title'],
      image: json['image'],
      uid: json['uid'],
      username: json['username'],
      viewers: json['viewers'],
      channelId: json['channelId'],
      startedAt: json['startedAt'],
    );
  }
}

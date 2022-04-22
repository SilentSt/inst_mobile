import 'package:inst_mobile/data/models/user.dart';

class GetCommentary {
  String uuid;
  String title;
  int likes;
  DateTime createdAt;
  DateTime updatedAt;
  GetSmallUser author;

  GetCommentary.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.title = json['title'],
        this.likes = json['likes'],
        this.createdAt = DateTime.parse(json['createdAt']),
        this.updatedAt = DateTime.parse(json['updatedAt']),
        this.author = GetSmallUser.fromJson(json['author']);
}

class PostCommentary {
  int post_id;
  String text;
  DateTime datetime;

  PostCommentary(
      {required this.post_id, required this.text, required this.datetime});

  Map<String, dynamic> toJson() {
    return {
      'post_id': this.post_id,
      'text': this.text,
      'datetime': this.datetime
    };
  }
}

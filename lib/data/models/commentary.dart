import 'package:inst_mobile/data/models/user.dart';

class GetCommentary {
  final String uuid;
  final String title;
  final int? likes;
  final bool? isLiked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final GetSmallUser author;

  GetCommentary.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.title = json['title'],
        this.likes = json['likes_count'],
        this.isLiked = json['is_liked'],
        this.createdAt = json['createdAt']==null?null:DateTime.parse(json['createdAt']),
        this.updatedAt = json['updatedAt']==null?null:DateTime.parse(json['updatedAt']),
        this.author = GetSmallUser.fromJson(json['author']);
}

class PostCommentary {
  final String text;

  PostCommentary(
      {required this.text});

  Map<String, dynamic> toJson() {
    return {
      "title": this.text.toString(),
    };
  }
}

import 'package:inst_mobile/data/models/likes.dart';
import 'package:inst_mobile/data/models/user.dart';

import 'commentary.dart';

class GetPost {
  final String uuid;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likesCount;
  final int commentsCount;
  final GetSmallUser author;

  GetPost.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.title = json['title'],
        this.description = json['description'],
        this.createdAt = DateTime.parse(json['created_at']),
        this.updatedAt = DateTime.parse(json['updated_at']),
        this.likesCount = json['likes_count'],
        this.commentsCount = json['comments_count'],
        this.author = GetSmallUser.fromJson(json['author']);
}

class GetPostWithoutAuthor {
  final String uuid;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likesCount;
  final int commentsCount;

  GetPostWithoutAuthor.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.title = json['title'],
        this.description = json['description'],
        this.createdAt = DateTime.parse(json['created_at']),
        this.updatedAt = DateTime.parse(json['updated_at']),
        this.likesCount = json['likes_count'],
        this.commentsCount = json['comments_count'];
}

class GetPostFull {
  final String uuid;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likesCount;
  final int commentsCount;
  final GetSmallUser author;
  final List<GetCommentary> commentaries;
  final List<GetLike> likes;

  GetPostFull.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.title = json['title'],
        this.description = json['description'],
        this.createdAt = DateTime.parse(json['created_at']),
        this.updatedAt = DateTime.parse(json['updated_at']),
        this.likesCount = json['likes_count'],
        this.commentsCount = json['comments_count'],
        this.author = GetSmallUser.fromJson(json['author']),
        this.commentaries = List.generate(json['comments'].length,
            (index) => GetCommentary.fromJson(json['comments'][index])),
        this.likes = List.generate(json['likes'].length,
            (index) => GetLike.fromJson(json['likes'][index]));
}

class UpdatePost {
  final String title;
  final String description;

  UpdatePost({required this.title, required this.description});

  Map<String, dynamic> toJson() {
    return {'title': this.title, 'description': this.description};
  }
}

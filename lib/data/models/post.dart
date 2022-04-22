import 'dart:io';

import 'package:inst_mobile/data/models/files.dart';
import 'package:inst_mobile/data/models/likes.dart';
import 'package:inst_mobile/data/models/user.dart';

import 'commentary.dart';

class GetPost {
  final String uuid;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int likesCount;
  final int commentsCount;
  final GetSmallUser author;
  final List<GetFile> files;

  GetPost.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.title = json['title'],
        this.description = json['description'],
        this.createdAt = DateTime.parse(json['created_at']),
        this.updatedAt = json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        this.likesCount = json['likes_count'],
        this.commentsCount = json['comments_count'],
        this.author = GetSmallUser.fromJson(json['author']),
        this.files = List.generate(json['files'].length,
            (index) => GetFile.fromJson(json['files'][index]));
}

class GetPostWithoutAuthor {
  final String uuid;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int likesCount;
  final int commentsCount;
  final List<GetFile> files;

  GetPostWithoutAuthor.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.title = json['title'],
        this.description = json['description'],
        this.createdAt = DateTime.parse(json['created_at']),
        this.updatedAt = json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        this.likesCount = json['likes_count'],
        this.commentsCount = json['comments_count'],
        this.files = List.generate(json['files'].length,
            (index) => GetFile.fromJson(json['files'][index]));
}

class GetPostFull {
  final String uuid;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int likesCount;
  final int commentsCount;
  final GetSmallUser author;
  final List<GetCommentary>? commentaries;
  final List<GetLike> likes;
  final List<GetFile> files;

  GetPostFull.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.title = json['title'],
        this.description = json['description'],
        this.createdAt = DateTime.parse(json['created_at']),
        this.updatedAt = json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        this.likesCount = json['likes_count'],
        this.commentsCount = json['comments_count'],
        this.author = GetSmallUser.fromJson(json['author']),
        this.commentaries = json['comments']==null?null: List.generate(json['comments'].length,
            (index) => GetCommentary.fromJson(json['comments'][index])),
        this.likes = json['likes']==null?[]:List.generate(json['likes'].length,
            (index) => GetLike.fromJson(json['likes'][index])),
        this.files = List.generate(json['files'].length,
            (index) => GetFile.fromJson(json['files'][index]));
}

class CreatePostBody {
  final List<File> files;
  final String title;
  final String description;

  CreatePostBody(
      {required this.files, required this.title, required this.description});
}

class UpdatePost {
  final String title;
  final String description;

  UpdatePost({required this.title, required this.description});

  Map<String, dynamic> toJson() {
    return {'title': this.title, 'description': this.description};
  }
}

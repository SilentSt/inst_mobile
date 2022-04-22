import 'package:inst_mobile/data/models/post.dart';


class GetFullUser {
  final String uuid;
  final String nickname;
  final String photo;
  final int postsCount;
  final int followingCount;
  final int followersCount;
  final List<GetPostWithoutAuthor> posts;

  GetFullUser.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.nickname = json['nickname'],
        this.photo = json['photo'],
        this.postsCount = json['posts_count'],
        this.followingCount = json['following_count'],
        this.followersCount = json['followers_count'],
        this.posts = List.generate(json['posts'].length,
            (index) => GetPostWithoutAuthor.fromJson(json['posts'][index]));
}

class GetUser {
  final String uuid;
  final String nickname;
  final String photo;
  final int postsCount;
  final int followingCount;
  final int followersCount;

  GetUser.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.nickname = json['nickname'],
        this.photo = json['photo'],
        this.postsCount = json['posts_count'],
        this.followingCount = json['following_count'],
        this.followersCount = json['followers_count'];
}

class GetSmallUser {
  final String uuid;
  final String nickname;
  final String photo;

  GetSmallUser.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.nickname = json['nickname'],
        this.photo = json['photo'];
}

class PostUser {
  String login;
  String password;
  String nickname;

  PostUser(
      {required this.login, required this.password, required this.nickname});

  Map<String, dynamic> toJson() {
    return {
      'login': this.login,
      'password': this.password,
      'nickname': this.nickname
    };
  }
}

class PatchUser {
  String? login;
  String? nickname;
  String? status;
  String? telegram;

  Map<String, dynamic> toJson() {
    return {
      'login': this.login,
      'nickname': this.nickname,
      'status': this.status,
      'telegram': this.telegram
    };
  }
}

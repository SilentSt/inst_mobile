import 'package:inst_mobile/data/models/post.dart';

import 'history.dart';

class GetUser {
  int id;
  String login;
  String nickname;
  String? status;
  String? telegram;
  List<GetPost>? posts;
  List<GetHistory>? histories;
  List<GetUser>? followed;
  List<GetUser>? followers;

  // GetUser(
  //     String? status,
  //     String? telegram,
  //     List<GetPost>? posts,
  //     List<GetHistory> histories,
  //     List<GetUser>? followed,
  //     List<GetUser>? followers,
  //     {required this.id,
  //     required this.login,
  //     required this.nickname}) {
  //   this.id = id;
  //   this.login = login;
  //   this.nickname = nickname;
  //   this.status = status;
  //   this.telegram = telegram;
  //   this.posts = posts;
  //   this.histories = histories;
  //   this.followed = followed;
  //   this.followers = followers;
  // }

  GetUser.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.login = json['login'],
        this.nickname = json['nickname'],
        this.status = json['status'],
        this.telegram = json['telegram'],
        this.posts = List.generate(json['posts'].length,
            (index) => GetPost.fromJson(json['posts'][index])),
        this.histories = List.generate(json['histories'].length,
            (index) => GetHistory.fromJson(json['histories'][index])),
        this.followed = List.generate(json['followed'].length,
            (index) => GetUser.fromJson(json['followed'][index])),
        this.followers = List.generate(json['followers'].length,
            (index) => GetUser.fromJson(json['followers'][index]));
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

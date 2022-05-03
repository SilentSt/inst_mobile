class GetFullMe {
  final String uuid;
  final String nickname;
  final String photo;
  final String? bio;
  final int postsCount;
  final int followingCount;
  final int followersCount;
  final List<GetSmallUser>? followers;
  final List<GetSmallUser>? following;

  GetFullMe.fromJson(Map<String, dynamic> json)
      : this.uuid = json['uuid'],
        this.nickname = json['nickname'],
        this.photo = json['photo'],
        this.bio = json['bio'],
        this.postsCount = json['posts_count'],
        this.followingCount = json['following_count'],
        this.followers = json['followers'] == null
            ? null
            : List.generate(
                json['followers'].length,
                (index) => GetSmallUser.fromJson(
                    json['followers'][index]['children'])),
        this.following = json['following'] == null
            ? null
            : List.generate(
            json['following'].length,
                (index) => GetSmallUser.fromJson(
                json['following'][index]['children'])),
        this.followersCount = json['followers_count'];

  GetSmallUser toSmallUser() =>
      GetSmallUser(uuid: this.uuid, nickname: this.nickname, photo: this.photo);
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

  GetSmallUser(
      {required this.uuid, required this.nickname, required this.photo});
}

class CreateUser {
  String email;
  String password;
  String nickname;

  CreateUser(
      {required this.email, required this.password, required this.nickname});

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'nickname': this.nickname
    };
  }
}

class UpdateUser {
  String? email;
  String? bio;
  String? password;

  //String? telegram;

  Map<String, dynamic> toJson() {
    return {
      'login': this.email,
      'bio': this.bio,
      'password': this.password,
      //'telegram': this.telegram
    };
  }
}

class GetCommentary {
  int id;
  String text;
  int likes;
  DateTime datetime;
  int author_id;

  GetCommentary.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.text = json['text'],
        this.likes = json['likes'],
        this.datetime = json['datetime'],
        this.author_id = json['author_id'];
}

class PostCommentary {
  int post_id;
  String text;
  DateTime datetime;

  PostCommentary(
      {required this.post_id, required this.text, required this.datetime});
}

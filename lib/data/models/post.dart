import 'commentary.dart';

class GetPost {
  int id;
  String title;
  String? description;
  String? filePath;
  DateTime datetime;
  int likes;
  List<GetCommentary>? commentaries;

  GetPost.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'],
        this.description = json['description'],
        this.filePath = json['filePath'],
        this.datetime = DateTime.parse(json['datetime']),
        this.likes = json['likes'],
        this.commentaries = List.generate(json['commentaries'].length,
            (index) => GetCommentary.fromJson(json['commentaries'][index]));
}

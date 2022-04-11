class GetHistory {
  int id;
  String filePath;
  int authorId;
  DateTime datetime;

  GetHistory.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.filePath = json['filePath'],
        this.authorId = json['authorId'],
        this.datetime = json['datetime'];
}

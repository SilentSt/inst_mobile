class GetFile {
  final String uuid;
  final String url;
  final String title;

  GetFile.fromJson(Map<String, dynamic> data)
      : this.uuid = data['uuid'],
        this.url = data['url'],
        this.title = data['title'];
}

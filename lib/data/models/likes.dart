import 'package:inst_mobile/data/models/user.dart';

class GetLike {
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String postUuid;
  final GetSmallUser author;

  GetLike.fromJson(Map<String, dynamic> data)
      : this.createdAt = DateTime.parse(data['created_at']),
        this.updatedAt = data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at']),
        this.postUuid = data['post_uuid'],
        this.author = GetSmallUser.fromJson(data['author']);
}

import 'package:inst_mobile/data/models/user.dart';

class GetLike {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String postUuid;
  final GetSmallUser user;

  GetLike.fromJson(Map<String, dynamic> data)
      : this.createdAt = data['created_at'],
        this.updatedAt = data['updated_at'],
        this.postUuid = data['post_uuid'],
        this.user = GetSmallUser.fromJson(data['user']);
}

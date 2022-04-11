import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User{

  @HiveField(0)
  String? username;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String? nickname;
}
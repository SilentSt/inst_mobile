import 'package:inst_mobile/data/models/user.dart';

abstract class GlobalSearchState {}

class GlobalSearchLoadingState extends GlobalSearchState {}

class GlobalSearchLoadedState extends GlobalSearchState {
  final List<GetSmallUser> users;
  //final List<GetPostFull> posts;

  GlobalSearchLoadedState({required this.users});
}

class GlobalSearchEmptyState extends GlobalSearchState {}

class GlobalSearchErrorState extends GlobalSearchState {
  String error;

  GlobalSearchErrorState({required this.error});
}

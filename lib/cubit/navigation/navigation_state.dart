import 'package:inst_mobile/data/models/post.dart';

abstract class NavigationState{}

class NavigationAuthState extends NavigationState{}

class NavigationGlobalSearchState extends NavigationState{}

class NavigationNewsState extends NavigationState{}

class NavigationProfileState extends NavigationState{}

class NavigationRegistrationState extends NavigationState{}

class NavigationCreatePostState extends NavigationState{}

class NavigationPostDetailsState extends NavigationState{
  final GetPostFull post;

  NavigationPostDetailsState({required this.post});
}

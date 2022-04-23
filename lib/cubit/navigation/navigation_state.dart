import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/data/models/user.dart';

abstract class NavigationState{}

class NavigationAuthState extends NavigationState{}

class NavigationGlobalSearchState extends NavigationState{}

class NavigationNewsState extends NavigationState{}

class NavigationProfileState extends NavigationState{
  final GetFullUser user;

  NavigationProfileState({required this.user});

}

class NavigationRegistrationState extends NavigationState{}

class NavigationCreatePostState extends NavigationState{}

class NavigationPostDetailsState extends NavigationState{
  final GetPostFull post;

  NavigationPostDetailsState({required this.post});
}

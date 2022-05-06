import 'package:bloc/bloc.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationStartPageState());

  void pushToAuthScene() => emit(NavigationAuthState());

  void pushToGlobalSearchScene() => emit(NavigationGlobalSearchState());

  void pushToNewsScene() => emit(NavigationNewsState());

  void pushToProfileScene(GetSmallUser? smallUser) =>
      emit(NavigationProfileState(smallUser: smallUser));

  void pushToRegistrationScene() => emit(NavigationRegistrationState());

  void pushToCreatePostScene() => emit(NavigationCreatePostState());
  
  void pushToProfileEditScene() => emit(NavigationProfileEditState());
  
  void pushToPostDetailsScene(GetPostFull post) =>
      emit(NavigationPostDetailsState(post: post));
}

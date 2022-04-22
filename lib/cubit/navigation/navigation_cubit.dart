import 'package:bloc/bloc.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState>{
  NavigationCubit() : super(NavigationAuthState());

  void pushToAuthScene() => emit(NavigationAuthState());

  void pushToGlobalSearchScene() => emit(NavigationGlobalSearchState());

  void pushToNewsScene() => emit(NavigationNewsState());

  void pushToProfileScene() => emit(NavigationProfileState());

  void pushToRegistrationScene() => emit(NavigationRegistrationState());

  void pushToCreatePostScene()=>emit(NavigationCreatePostState());

  void pushToPostDetailsScene(GetPostFull post) => emit(NavigationPostDetailsState(post: post));

}
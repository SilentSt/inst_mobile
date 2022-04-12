import 'package:bloc/bloc.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState>{
  NavigationCubit() : super(NavigationAuthState());

  void pushToAuthScene() => emit(NavigationAuthState());

  void pushToGlobalSearchScene() => emit(NavigationGlobalSearchState());

  void pushToNewsScene() => emit(NavigationNewsState());

  void pushToProfileScene() => emit(NavigationProfileState());

  void pushToRegistrationScene() => emit(NavigationRegistrationState());

}
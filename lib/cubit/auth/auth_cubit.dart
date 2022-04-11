import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(AuthLoadingState());


  String? username;
  String? password;

  Future<void> login()async{

  }

}
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/auth/auth_state.dart';
import 'package:inst_mobile/data/api/user.dart';
import 'package:inst_mobile/data/temp_data.dart';

import '../../resources/app_strings.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(AuthLoadingState());


  String? username;
  String? password;

  Future<void> login({required String username, required String password})async{
    emit(AuthLoadingState());
    http.Response response = await UserApi.authorize({'username':username, 'password':password});
    Map<String, dynamic> data = jsonDecode(response.body);
    if(response.statusCode>299)
      {
        emit(AuthErrorState(error: data['detail']));
      }
    else{
      TempData.token = data['access_token'];
      TempData.myId = data['user_id'];
      emit(AuthAuthorizedState());
    }
  }

  Future<void> checkAppReadyToStart()async {
    emit(AuthLoadingState());
    try {
      final result = await InternetAddress.lookup(AppStrings.networkTesterUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        emit(AuthLoadedState());
        return;
      }
    } on SocketException catch (_) {
      emit(AuthErrorState(error: AppStrings.networkException));
      return;
    }
    emit(AuthErrorState(error: AppStrings.unhandledException));
  }

  Future<void> acceptError()async{
    emit(AuthLoadedState());
  }

}
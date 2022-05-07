import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/auth/auth_state.dart';
import 'package:inst_mobile/data/api/user.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

import '../../resources/app_strings.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoadingState());
  String? username;
  String? password;

  Future<void> login(
      {required String username, required String password}) async {
    emit(AuthLoadingState());
    http.Response response = await UserApi.authorize(
      {
        'username': username.replaceAll(' ', ''),
        'password': password.replaceAll(' ', ''),
      },
    );
    Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode > 299) {
      print(response.body);
      emit(AuthErrorState(error: data['detail']));
    } else {
      TempData.token = data['access_token'];
      TempData.myId = data['user_id'];
      http.Response myResponse = await UserApi.getMe();
      if (myResponse.statusCode > 299) {
        if (myResponse.statusCode > 499) {
          emit(AuthErrorState(error: AppStrings.serverError));
        } else {
          Map<String, dynamic> mData =
              json.decode(utf8.decode(myResponse.bodyBytes));
          emit(AuthErrorState(error: mData['detail']));
        }
      } else {
        TempData.me =
            GetFullMe.fromJson(json.decode(utf8.decode(myResponse.bodyBytes)));
        emit(AuthAuthorizedState());
      }
    }
  }

  Future<void> checkAppReadyToStart() async {
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

  Future<void> acceptError() async {
    emit(AuthLoadedState());
  }
}

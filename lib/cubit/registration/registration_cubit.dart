import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/data/api/user.dart';
import 'package:inst_mobile/data/models/user.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationLoadedState());

  String? username;
  String? password;
  String? nickname;

  Future<void> registrate(
      {required String username,
      required String password,
      required String nickname}) async {
    emit(RegistrationLoadingState());
    var user =
        PostUser(login: username, password: password, nickname: nickname);
    var response = await UserApi.createUser(user);
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode > 299) {
      emit(RegistrationErrorState(error: data['detail'].toString()));
    } else {
      emit(RegistrationSuccessState());
    }
  }

  Future<void> acceptError() async {
    emit(RegistrationLoadedState());
  }
}

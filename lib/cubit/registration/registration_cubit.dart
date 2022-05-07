import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/data/api/user.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationLoadedState());

  Future<void> createUser({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(RegistrationLoadingState());
    var user = CreateUser(
      email: email,
      password: password,
      nickname: username,
    );
    var response = await UserApi.createUser(user);
    Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
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

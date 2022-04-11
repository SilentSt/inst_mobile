import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(RegistrationState initialState)
      : super(RegistrationLoadingState());

  String? username;
  String? password;
  String? nickname;

  Future<void> registrate(
      String username, String password, String nickname) async {}
}

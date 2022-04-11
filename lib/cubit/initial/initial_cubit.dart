import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/initial/cubit.dart';
import 'dart:io';

import 'package:inst_mobile/resources/app_strings.dart';

class InitialCubit extends Cubit<InitialState>{
  InitialCubit() : super(InitialLoadingState());

  Future<void> checkAppReadyToStart()async {
    emit(InitialLoadingState());
    try {
      final result = await InternetAddress.lookup(AppStrings.networkTesterUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        emit(InitialLoadedState());
        return;
      }
    } on SocketException catch (_) {
      emit(InitialErrorState(error: AppStrings.networkException));
      return;
    }
    emit(InitialErrorState(error: AppStrings.unhandledException));
  }

}
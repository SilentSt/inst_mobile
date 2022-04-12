import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileLoadedState());


  Future<void> loadData()async{
    emit(ProfileLoadingState());
    //TODO: load data
    emit(ProfileLoadedState());
  }

  Future<void> acceptError()async{
    emit(ProfileLoadedState());
  }
}
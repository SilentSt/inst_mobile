import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileLoadingState());

}
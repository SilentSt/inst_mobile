import 'package:flutter/material.dart';
import 'package:inst_mobile/cubit/auth/auth_cubit.dart';
import 'package:inst_mobile/cubit/global_search/cubit.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/ui/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Starter());
}

class Starter extends StatelessWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<GlobalSearchCubit>(
            create: (context) => GlobalSearchCubit()),
        BlocProvider<NewsCubit>(create: (context) => NewsCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
        BlocProvider<RegistrationCubit>(
          create: (context) => RegistrationCubit(),
        ),
        BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
        BlocProvider<PostDetailsCubit>(create: (context) => PostDetailsCubit())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: AppNavigator(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inst_mobile/cubit/auth/auth_cubit.dart';
import 'package:inst_mobile/cubit/global_search/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/ui/scene/initial_scene.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiProvider(
    providers: [],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<GlobalSearchCubit>(
            create: (context) => GlobalSearchCubit()),
        BlocProvider<NewsCubit>(create: (context) => NewsCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
        BlocProvider<RegistrationCubit>(
            create: (context) => RegistrationCubit())
      ],
      child: InitialScene(),
    ),
  ));
}

class Starter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: InitialScene(),
      ),
    );
  }
}

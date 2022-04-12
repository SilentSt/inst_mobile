import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
      int currentPage = 0;
      var _cubit = context.read<NavigationCubit>();
      if (state is NavigationNewsState) currentPage = 0;
      if (state is NavigationGlobalSearchState) currentPage = 1;
      if (state is NavigationProfileState) currentPage = 2;
      return BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: currentPage,
          onTap: (index) {
            switch (index) {
              case 0:
                _cubit.pushToNewsScene();
                break;
              case 1:
                _cubit.pushToGlobalSearchScene();
                break;
              case 2:
                _cubit.pushToProfileScene();
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(label: "",icon: Icon(Icons.newspaper)),
            BottomNavigationBarItem(label: "",icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "",icon: Icon(Icons.person))
          ]);
    });
  }
}

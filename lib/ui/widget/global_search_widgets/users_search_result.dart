import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';

import '../../../cubit/profile/profile_cubit.dart';
import '../../../data/models/user.dart';

class UsersSearchResult extends StatelessWidget {
  const UsersSearchResult({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<GetSmallUser> users;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(
            users.length,
                (index) => Card(
              elevation: 0,
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: ImageNetwork(
                      height: 90,
                      width: 90,
                      onTap: (){
                        context.read<ProfileCubit>().clearData();
                        context.read<NavigationCubit>().pushToProfileScene(users[index]);
                      },
                      image: users[index].photo),
                ),
                Expanded(child: Text(users[index].nickname))
              ]),
            )));
  }
}
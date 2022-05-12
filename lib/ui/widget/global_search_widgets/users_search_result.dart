import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

import '../../../cubit/profile/profile_cubit.dart';
import '../../../data/models/user.dart';

class UsersSearchResult extends StatelessWidget {
  const UsersSearchResult({
    Key? key,
    required this.users,
  }) : super(key: key);

  final GetSmallUser users;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ImageNetwork(
          image: users.photo,
          fitAndroidIos: BoxFit.cover,
          height: (MediaQuery.of(context).size.width - 2) / 3,
          width: (MediaQuery.of(context).size.width - 2) / 3,
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 2) / 3,
          height: 25,
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black12, Colors.black45],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                users.nickname,
                style: AppTextStyles.h3.white().copyWith(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 255),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

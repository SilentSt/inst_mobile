import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/ui/widget/history_widgets/history.dart';
import '../../../cubit/news/cubit.dart';

class HistoryBar extends StatelessWidget {
  const HistoryBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var _cubit = context.read<NewsCubit>();
    return SizedBox(
      height: 100,
      width: screenSize.width - 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              _cubit.followingHistories.length,
              (index) => History(index: index,)),
        ),
      ),
    );
  }
}

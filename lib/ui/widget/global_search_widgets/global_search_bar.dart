import 'package:flutter/material.dart';
import '../../../cubit/global_search/global_search_cubit.dart';
import '../../../resources/app_colors.dart';
import '../../controllers/text_editing_controllers.dart';
import '../../styles/app_text_styles.dart';

class GlobalSearchBar extends StatelessWidget {
  const GlobalSearchBar({
    Key? key,
    required GlobalSearchCubit cubit,
  })  : _cubit = cubit,
        super(key: key);

  final GlobalSearchCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: GlobalSearchControllers.searchController,
      textAlign: TextAlign.left,
      onSubmitted: (res) {
        _cubit
            .find(GlobalSearchControllers.searchController.text);
      },
      onEditingComplete: () {
        _cubit
            .find(GlobalSearchControllers.searchController.text);
      },
      style: AppTextStyles.h3.green().size(20),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 8),
          border: UnderlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: AppColors.darkGrey)),
          errorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: Colors.red)),
          enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: AppColors.darkGrey)),
          disabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: AppColors.darkGrey)),
          focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: AppColors.darkGrey)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: Colors.red))),
    );
  }
}

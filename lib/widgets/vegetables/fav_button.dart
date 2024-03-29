import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vegetables/cubits/cubit/my_states_cubit.dart';
import 'package:vegetables/models/vegetables.dart';
import 'package:vegetables/styles/style.dart';

class FavButton extends StatelessWidget {
  const FavButton(
      {super.key, required this.vegetable, required this.quarterWidth});
  final VegetablesModel vegetable;
  final double quarterWidth;

  @override
  Widget build(BuildContext context) {
    String favIcon = 'assets/svg/heart.svg';
    Color favIconColor = AppStyles.blackColor;

    setDefaultsFavIcon() {
      favIcon = 'assets/svg/heart.svg';
      favIconColor = AppStyles.blackColor;
    }

    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        state.maybeWhen(
            initial: () {
              setDefaultsFavIcon();
            },
            orElse: () => {
                  setDefaultsFavIcon(),
                  if (vegetable.isFavorite == true)
                    {
                      favIcon = 'assets/svg/favorite.svg',
                      favIconColor = AppStyles.redColor
                    }
                });
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          width: quarterWidth,
          child: OutlinedButton(
              onPressed: () => {
                    context
                        .read<FavoritesCubit>()
                        .clickFavorite(vegetable: vegetable),
                  },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: AppStyles.whiteColor),
              child: SvgPicture.asset(favIcon, color: favIconColor)),
        );
      },
    );
  }
}

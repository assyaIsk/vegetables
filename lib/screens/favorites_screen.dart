import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/cubits/cubit/my_states_cubit.dart';
import 'package:vegetables/data/vegetable_data.dart';
import 'package:vegetables/models/vegetables.dart';
import 'package:vegetables/widgets/header/header.dart';
import 'package:vegetables/widgets/vegetables/vegetable_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    checkfavorites() {
      return vegetables.where((e) => e.isFavorite).toList();
    }

    final List<VegetablesModel> favoriteList = checkfavorites();

    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Header(screenName: 'Favorites', isFirstTab: false),

          //list of vegetables
          state.when(
            initial: () => favoriteList.isEmpty
                ? const Center(child: Text('no favorites'))
                : VegetableList(vegetables: favoriteList),
            favorite: (vegetable, isFavorite) => checkfavorites().isEmpty
                ? const Center(child: Text('no favorites'))
                : VegetableList(vegetables: checkfavorites()),
          ),
        ]);
      },
    );
  }
}

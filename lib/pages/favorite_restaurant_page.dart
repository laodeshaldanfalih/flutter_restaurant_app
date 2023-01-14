import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import '../provider/restaurant_search_provider.dart';
import '../utils/result_state.dart';
import '../widgets/widgets.dart';

class FavoriteRestaurantPage extends StatelessWidget {
  static const routeName = '/favorite-restaurant';
  static const String favoritesTitle = 'Favorites';
  const FavoriteRestaurantPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(favoritesTitle)),
      body: Consumer<DatabaseProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: provider.favorites.length,
              itemBuilder: (context, index) {
                return RestaurantSearchListCard(
                  restaurant: provider.favorites[index],
                );
              },
            );
          } else {
            return const Center(
              child: Material(
                child: Text('Belum ada rstauran favorite nih!'),
              ),
            );
          }
        },
      ),
    );
  }
}

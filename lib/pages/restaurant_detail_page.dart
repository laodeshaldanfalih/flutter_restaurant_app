import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/widgets/widgets.dart';

import '../provider/restaurant_search_provider.dart';
import '../utils/result_state.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/detail-page';
  Restauranttt restaurants;

  RestaurantDetailPage({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantDetailProvider(
          apiService: ApiService(), restaurants: restaurants),
      child: Consumer<RestaurantDetailProvider>(
        builder: (context, state, child) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            var restaurant = state.result;
            return Scaffold(
              appBar: AppBar(title: Text(restaurant.restaurant.name)),
              body: RestaurantDetailWidget(
                restaurant: restaurant.restaurant,
                restauranttt: restaurants,
              ),
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.network_wifi_sharp),
                    Text('Sorry, no internet connection...'),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      ),
    );
  }
}

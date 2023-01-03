import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/pages.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/widgets/widgets.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantlistProvider>(
      builder: (context, state, child) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Nearest Restaurant'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SearchPage.routeName);
                    },
                    child: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            // body: ListView.builder(
            //     itemBuilder: (context, index) {
            //       var restaurant = state.result.restaurants[index];
            //       return RestaurantListCard(restaurant: restaurant);
            //     },
            //     itemCount: state.result.restaurants.length),
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
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
    );
  }
}

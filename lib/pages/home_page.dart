import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ChangeNotifierProvider<RestaurantlistProvider>(
        create: (context) => RestaurantlistProvider(apiService: ApiService()),
        child: const RestaurantListWidget(),
      ),
    );
  }
}

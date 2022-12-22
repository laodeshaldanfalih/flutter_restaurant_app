import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearest Restaurant'),
      ),
      body: Column(
        children: [
          RestaurantListWidget(),
        ],
      ),
    );
  }
}

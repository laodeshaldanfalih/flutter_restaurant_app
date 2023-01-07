import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'common/styles.dart';
import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RestaurantApp',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: myTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
      ),
      initialRoute: SearchPage.routeName,
      routes: {
        SearchPage.routeName: (context) => const SearchPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
            restaurants:
                ModalRoute.of(context)?.settings.arguments as Restauranttt),
        FavoriteRestaurantPage.routeName: (context) =>
            const FavoriteRestaurantPage(),
      },
    );
  }
}

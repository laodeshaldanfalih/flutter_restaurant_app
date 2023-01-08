import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'common/styles.dart';
import 'data/api/api_service.dart';
import 'data/db/database_helper.dart';
import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RestaurantSearchProvider(
              apiService: ApiService(), query: SearchPage.query),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              DatabaseProvider(databaseHelper: DatabaseHelper()),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

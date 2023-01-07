import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/widgets/widgets.dart';

class SearchPage extends StatefulWidget {
  static const routeName = 'search-page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final myController = TextEditingController();
  String query = ' ';
  bool search = true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (context) =>
          RestaurantSearchProvider(apiService: ApiService(), query: query),
      child: Consumer<RestaurantSearchProvider>(
        builder: (context, state, child) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return RestaurantListWidget(
              myController: myController,
              search: search,
              query: query,
              state: state,
            );
          } else if (state.state == ResultState.noData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Nearest Restaurant'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          query = ' ';
                          myController.text = ' ';
                          search = true;
                          state.fetchAllRestaurantData(query);
                        });
                      },
                      child: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.restaurant),
                    Text('Sorry, there\'s no restaurant or foods'),
                  ],
                ),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Scaffold(
              appBar: AppBar(),
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

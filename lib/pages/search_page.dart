import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/widgets/restaurant_search_list_card.dart';
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
            return Scaffold(
              appBar: AppBar(
                // centerTitle: true,
                title: // Note: Same code is applied for the TextFormField as well
                    Container(
                  width: 280,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            print("search");
                            setState(() {
                              // if (myController.text.isEmpty) {
                              //   myController.text = ' ';
                              // }
                              // query = myController.text;
                            });
                          },
                          controller: myController,
                          cursorColor: Colors.black,
                          autocorrect: true,
                          decoration: const InputDecoration(
                            hintText: 'Restaurant, foods, drinks',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (myController.text.isEmpty) {
                            myController.text = ' ';
                          }
                          query = myController.text;
                          print(query);
                          state.fetchAllRestaurantData(query);
                        },
                        child: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              body: ListView.builder(
                  itemBuilder: (context, index) {
                    var restaurant = state.result.restaurants[index];
                    return RestaurantSearchListCard(restaurant: restaurant);
                  },
                  itemCount: state.result.restaurants.length),
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

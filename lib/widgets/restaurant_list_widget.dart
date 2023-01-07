import 'package:flutter/material.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/pages/pages.dart';
import 'widgets.dart';

class RestaurantListWidget extends StatefulWidget {
  final TextEditingController myController;
  bool search = false;
  String query = ' ';
  final RestaurantSearchProvider state;

  RestaurantListWidget(
      {super.key,
      required this.search,
      required this.myController,
      required this.query,
      required this.state});
  @override
  State<RestaurantListWidget> createState() => _RestaurantListWidgetState();
}

class _RestaurantListWidgetState extends State<RestaurantListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.search
          ? AppBar(
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, FavoriteRestaurantPage.routeName);
                  },
                  child: Icon(Icons.fastfood_outlined),
                ),
              ),
              title: const Text('Nearest Restaurant'),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.search = !widget.search;
                      });
                    },
                    child: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          : AppBar(
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, FavoriteRestaurantPage.routeName);
                  },
                  child: const Icon(Icons.fastfood_outlined),
                ),
              ),
              title: Container(
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
                          setState(() {
                            if (widget.myController.text.isEmpty) {
                              widget.myController.text = ' ';
                            }
                            widget.query = widget.myController.text;
                            widget.state.fetchAllRestaurantData(widget.query);
                          });
                        },
                        controller: widget.myController,
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
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.myController.text.isEmpty) {
                          widget.myController.text = ' ';
                        }
                        widget.query = widget.myController.text;
                        widget.state.fetchAllRestaurantData(widget.query);
                      },
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            var restaurant = widget.state.result.restaurants[index];
            return GestureDetector(
                onPanDown: (details) {
                  setState(() {
                    if (widget.query == ' ') {
                      widget.search = true;
                    }
                  });
                },
                child: RestaurantSearchListCard(restaurant: restaurant));
          },
          itemCount: widget.state.result.restaurants.length),
    );
  }
}

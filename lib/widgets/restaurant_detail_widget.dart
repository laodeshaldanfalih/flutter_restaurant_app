import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/widgets/widgets.dart';
import '../data/model/model.dart';

class RestaurantDetailWidget extends StatelessWidget {
  Restaurantt restaurant;
  Restauranttt restauranttt;
  RestaurantDetailWidget(
      {Key? key, required this.restaurant, required this.restauranttt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 295,
                color: Colors.transparent,
              ),
              Stack(
                children: [
                  Image.network(
                      'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}'),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                        color: Colors.black38,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              restaurant.name,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 25,
                            ),
                            Text(
                              restaurant.rating.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 35,
                child: Consumer<DatabaseProvider>(
                  builder: (context, provider, child) {
                    return FutureBuilder<bool>(
                      future: provider.isFavorited(restaurant.id),
                      builder: (context, snapshot) {
                        var isFavorited = snapshot.data ?? false;
                        return CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 20,
                          child: isFavorited
                              ? IconButton(
                                  iconSize: 25,
                                  color: Colors.black,
                                  onPressed: () =>
                                      provider.removeFavorite(restauranttt.id),
                                  icon: const Icon(
                                    Icons.favorite,
                                  ),
                                )
                              : IconButton(
                                  iconSize: 25,
                                  color: Colors.black,
                                  onPressed: () {
                                    print(restauranttt.id);
                                    provider.addFavorite(restauranttt);
                                  },
                                  icon: const Icon(
                                    Icons.favorite_border,
                                  ),
                                ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          DescriptionWidget(restaurant: restaurant),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Text(
              '${restaurant.name}\'s Menu',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          FoodsWidget(restaurant: restaurant, image: 'assets/images/foods.png'),
          DrinksWidget(
              restaurant: restaurant, image: 'assets/images/drinks.png'),
          ReviewWidget(
            restaurant: restaurant,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

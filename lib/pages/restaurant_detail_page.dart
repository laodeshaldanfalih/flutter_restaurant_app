import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/widgets.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant-detail-page';
  final Restaurant restaurant;
  // final Menus menus;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(restaurant.pictureId),
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DescriptionWidget(restaurant: restaurant),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                '${restaurant.name}\'s Menu',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            FoodsWidget(
                restaurant: restaurant, image: 'assets/images/foods.png'),
            DrinksWidget(
                restaurant: restaurant, image: 'assets/images/drinks.png'),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/pages/pages.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildRestaurantList(BuildContext context, Restaurant restaurant) {
      return Material(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.blueGrey,
              height: 80,
              width: 80,
              child: Image.network(
                restaurant.pictureId,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    size: 15,
                  ),
                  Text(
                    restaurant.city,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
              Row(children: [
                const Icon(
                  Icons.star,
                  size: 15,
                ),
                Text(
                  restaurant.rating.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ]),
            ],
          ),
          onTap: () => Navigator.pushNamed(
              context, RestaurantDetailPage.routeName,
              arguments: restaurant),
        ),
      );
    }

    Widget _buildList(BuildContext context) {
      return FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/database/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return _buildRestaurantList(context, restaurant[index]);
            },
          );
        },
      );
    }

    return Expanded(
      child: _buildList(context),
    );
  }
}

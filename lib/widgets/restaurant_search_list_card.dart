import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/provider/database_provider.dart';

class RestaurantSearchListCard extends StatelessWidget {
  Restauranttt restaurant;
  RestaurantSearchListCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(restaurant.id),
          builder: (context, snapshot) {
            var isFavorited = snapshot.data ?? false;
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Colors.blueGrey,
                  height: 80,
                  width: 80,
                  child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
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
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
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
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'package:restaurant_app/pages/pages.dart';

class RestaurantListCard extends StatelessWidget {
  Restauranttt restaurant;
  RestaurantListCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
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
      onTap: () => Navigator.pushNamed(context, RestaurantDetailPage.routeName,
          arguments: restaurant),
    );
  }
}

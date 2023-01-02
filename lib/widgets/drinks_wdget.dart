import 'package:flutter/material.dart';

import '../data/model/model.dart';

class DrinksWidget extends StatelessWidget {
  final Restaurantt restaurant;
  final String image;
  const DrinksWidget({Key? key, required this.restaurant, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 100,
            width: 100,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/drinks.png',
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    restaurant.menus.drinks[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: restaurant.menus.foods.length,
      ),
    );
  }
}

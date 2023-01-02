import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/widgets.dart';
import '../data/model/model.dart';

class RestaurantDetailWidget extends StatelessWidget {
  Restaurantt restaurant;
  RestaurantDetailWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          FoodsWidget(restaurant: restaurant, image: 'assets/images/foods.png'),
          DrinksWidget(
              restaurant: restaurant, image: 'assets/images/drinks.png'),
          // Row(
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          //       child: const Text(
          //         'Testimony',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           addReview(
          //             context,
          //             myController1,
          //             myController2,
          //           );

          //           print('aa');
          //         });
          //       },
          //       child: Container(
          //         margin: const EdgeInsets.only(top: 15),
          //         decoration: BoxDecoration(
          //             color: const Color.fromARGB(71, 189, 189, 189),
          //             borderRadius: BorderRadius.circular(10)),
          //         child: const Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //           child: Text(
          //             '+ Write Your Review',
          //             style:
          //                 TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ReviewWidget(
            restaurant: restaurant,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

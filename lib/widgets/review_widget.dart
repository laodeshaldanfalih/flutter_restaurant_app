import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/model.dart';

class ReviewWidget extends StatelessWidget {
  final Restaurantt restaurant;
  const ReviewWidget({Key? key, required this.restaurant}) : super(key: key);

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
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(82, 158, 158, 158)),
                color: const Color.fromARGB(32, 184, 178, 178),
                borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        restaurant.customerReviews[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ),
                    Text(
                      ' •${restaurant.customerReviews[index].date}',
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 13),
                    ),
                  ],
                ),
                Text(
                  '\'${restaurant.customerReviews[index].review}\'',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: restaurant.customerReviews.length,
      ),
    );
  }
}

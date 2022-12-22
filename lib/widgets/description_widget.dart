import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class DescriptionWidget extends StatelessWidget {
  final Restaurant restaurant;
  const DescriptionWidget({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: const Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Text(
            restaurant.description,
          ),
        ),
      ],
    );
  }
}

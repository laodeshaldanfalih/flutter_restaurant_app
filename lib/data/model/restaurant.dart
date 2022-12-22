import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  // named constructor : untuk mengonversi format json menjadi bentuk object Article
  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
        id: restaurant['id'],
        name: restaurant['name'],
        description: restaurant['description'],
        pictureId: restaurant['pictureId'],
        city: restaurant['city'],
        rating: double.parse(restaurant['rating'].toString()),
        menus: Menus.fromJson(restaurant['menus']),
      );
}

// mengakses data restaurants
List<Restaurant> parseRestaurant(String? json) {
  final List<Restaurant> list;
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)['restaurants'];
  list = parsed.map((json) => Restaurant.fromJson(json)).toList();
  return list;
}

class FoodAndDrink {
  String name;

  FoodAndDrink({
    required this.name,
  });

  factory FoodAndDrink.fromJson(Map<String, dynamic> menus) =>
      FoodAndDrink(name: menus["name"]);
}

class Menus {
  List<FoodAndDrink> foods;
  List<FoodAndDrink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> menus) => Menus(
        foods: List<FoodAndDrink>.from(
          menus["foods"].map(
            (x) => FoodAndDrink.fromJson(x),
          ),
        ),
        drinks: List<FoodAndDrink>.from(
          menus["drinks"].map(
            (x) => FoodAndDrink.fromJson(x),
          ),
        ),
      );
}

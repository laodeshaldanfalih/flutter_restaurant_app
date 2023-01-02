// class RestaurantSearch {
//   RestaurantSearch({
//     required this.error,
//     required this.founded,
//     required this.restaurants,
//   });

//   bool error;
//   int founded;
//   List<Restaurantt> restaurants;

//   factory RestaurantSearch.fromJson(Map<String, dynamic> json) =>
//       RestaurantSearch(
//         error: json["error"],
//         founded: json["founded"],
//         restaurants: List<Restaurantt>.from(
//             json["restaurants"].map((x) => Restaurantt.fromJson(x))),
//       );
// }

// class Restaurantt {
//   Restaurantt({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.pictureId,
//     required this.city,
//     required this.rating,
//   });

//   String id;
//   String name;
//   String description;
//   String pictureId;
//   String city;
//   double rating;

//   factory Restaurantt.fromJson(Map<String, dynamic> json) => Restaurantt(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         pictureId: json["pictureId"],
//         city: json["city"],
//         rating: json["rating"].toDouble(),
//       );
// }

// import 'package:flutter/material.dart';
// import 'package:restaurant_app/data/model/model.dart';
// // import 'package:restaurant_app/widgets/widgets.dart';

// class RestaurantDetailPage extends StatelessWidget {
//   static const routeName = '/restaurant-detail-page';
//   final Restaurant restaurant;
//   // final Menus menus;

//   const RestaurantDetailPage({Key? key, required this.restaurant})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(restaurant.name),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Image.network(restaurant.pictureId),
//                 Positioned(
//                   bottom: 0,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(40),
//                       ),
//                       color: Colors.black38,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 15, vertical: 5),
//                       child: Row(
//                         children: [
//                           Text(
//                             restaurant.name,
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 25),
//                           ),
//                           const SizedBox(width: 10),
//                           const Icon(
//                             Icons.star,
//                             color: Colors.orange,
//                             size: 25,
//                           ),
//                           Text(
//                             restaurant.rating.toString(),
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 20),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // DescriptionWidget(restaurant: restaurant),
//             // Container(
//             //   margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
//             //   child: Text(
//             //     '${restaurant.name}\'s Menu',
//             //     style:
//             //         const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             //   ),
//             // ),
//             // FoodsWidget(
//             //     restaurant: restaurant, image: 'assets/images/foods.png'),
//             // DrinksWidget(
//             //     restaurant: restaurant, image: 'assets/images/drinks.png'),
//             // const SizedBox(height: 100)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/widgets/widgets.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/detail-page';
  Restaurant restaurants;
  RestaurantDetailPage({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (context) => RestaurantDetailProvider(
          apiService: ApiService(), restaurants: restaurants),
      child:
          Consumer<RestaurantDetailProvider>(builder: (context, state, child) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          var restaurant = state.result;
          return Scaffold(
            appBar: AppBar(title: Text(restaurant.restaurant.name)),
            body: RestaurantDetailWidget(
              restaurant: restaurant.restaurant,
            ),
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      }),
    );
  }
}

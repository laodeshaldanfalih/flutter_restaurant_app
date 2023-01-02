import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/model.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantList> restaurantList() async {
    final response = await http.get(Uri.parse("${_baseUrl}list"));
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list data');
    }
  }

  Future<RestaurantDetail> restarurantDetail(String id) async {
    final response = await http.get(Uri.parse("${_baseUrl}detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail page');
    }
  }

  // Future<RestaurantSearch> restaurantSearch() async {
  //   final response = await http.get(Uri.parse("${_baseUrl}"));
  //   if (response.statusCode == 200) {
  //     return RestaurantSearch.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load top headlines');
  //   }
  // }
}

import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'package:restaurant_app/data/model/restaunrat_list.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  final Client client;
  ApiService(this.client);

  Future<RestaurantList> restaurantList() async {
    final response = await client.get(Uri.parse("${_baseUrl}list"));
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list page');
    }
  }

  Future<RestaurantDetail> restarurantDetail(String id) async {
    final response = await client.get(Uri.parse("${_baseUrl}detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail page');
    }
  }

  Future<RestaurantSearch> restaurantSearch(String query) async {
    final response = await client.get(Uri.parse("${_baseUrl}search?q=$query"));
    if (response.statusCode == 200) {
      return RestaurantSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant data for search page');
    }
  }
}

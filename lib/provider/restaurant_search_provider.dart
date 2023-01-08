import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_search.dart';

import '../utils/result_state.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  late String query;

  RestaurantSearchProvider({required this.apiService, required this.query}) {
    fetchAllRestaurantData(query);
  }

  late RestaurantSearch _restaurantSearchtResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantSearch get result => _restaurantSearchtResult;

  ResultState get state => _state;

  Future<dynamic> fetchAllRestaurantData(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.restaurantSearch(query);
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantSearchtResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Errorrr --> $e';
    }
  }
}

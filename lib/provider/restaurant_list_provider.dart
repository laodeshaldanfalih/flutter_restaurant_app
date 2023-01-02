import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/model.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantlistProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantlistProvider({required this.apiService}) {
    _fetchAllRestaurantData();
  }

  late RestaurantList _restaurantListResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantList get result => _restaurantListResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurantData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.restaurantList();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantListResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

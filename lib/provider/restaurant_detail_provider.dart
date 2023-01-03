import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/model.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantDetailProvider extends ChangeNotifier {
  Restaurant restaurants;
  final ApiService apiService;

  RestaurantDetailProvider(
      {required this.apiService, required this.restaurants}) {
    _fetchAllRestaurantData();
  }

  late RestaurantDetail _restaurantDetailResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantDetail get result => _restaurantDetailResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurantData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.restarurantDetail(restaurants.id);
      if (restaurant.restaurant.id.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantDetailResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Errorr --> $e';
    }
  }
}

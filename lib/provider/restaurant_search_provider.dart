import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_search.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  String query;

  RestaurantSearchProvider({required this.apiService, required this.query}) {
    _fetchAllRestaurantData();
  }

  late RestaurantSearch _restaurantSearchtResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantSearch get result => _restaurantSearchtResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurantData() async {
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
      return _message = 'Error --> $e';
    }
  }

  void onSearch(String queries) {
    queries = query;
    print(queries);
    _fetchAllRestaurantData();
    // notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';

import '../data/db/database_helper.dart';
import '../utils/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getFavorites();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Restauranttt> _favorites = [];
  List<Restauranttt> get favorites => _favorites;

  void _getFavorites() async {
    _favorites = await databaseHelper.getFavorites();
    if (_favorites.length > 0) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
    }
    notifyListeners();
  }

  void addFavorite(Restauranttt restaurant) async {
    try {
      await databaseHelper.insertFavorite(restaurant);
      _getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async {
    final bookmarkedArticle = await databaseHelper.getFavoriteById(id);
    return bookmarkedArticle.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}

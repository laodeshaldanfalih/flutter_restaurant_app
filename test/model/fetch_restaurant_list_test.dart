import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaunrat_list.dart';
import 'fetch_restaurant_list_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('restaurantSearch', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
          .thenAnswer((_) async => http.Response(
                '{"error": false, "message": "success", "count": 20, "restaurants":[]}',
                200,
              ));

      expect(await ApiService(client).restaurantList(), isA<RestaurantList>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(ApiService(client).restaurantList(), throwsException);
    });
  });
}

import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/data/model/model.dart';
import 'package:restaurant_app/pages/setting_page.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'common/styles.dart';
import 'data/api/api_service.dart';
import 'data/db/database_helper.dart';
import 'pages/pages.dart';
import 'utils/background_service.dart';
import 'utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(RestaurantDetailPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RestaurantSearchProvider(
              apiService: ApiService(), query: SearchPage.query),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider<SchedulingProvider>(
          create: (_) => SchedulingProvider(),
          child: const SettingsPage(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'RestaurantApp',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 0),
          textTheme: myTextTheme,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                onPrimary: Colors.black,
                secondary: secondaryColor,
              ),
        ),
        initialRoute: SearchPage.routeName,
        routes: {
          SearchPage.routeName: (context) => const SearchPage(),
          RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurants:
                  ModalRoute.of(context)?.settings.arguments as Restauranttt),
          FavoriteRestaurantPage.routeName: (context) =>
              const FavoriteRestaurantPage(),
          SettingsPage.routeName: (context) => const SettingsPage()
        },
      ),
    );
  }
}

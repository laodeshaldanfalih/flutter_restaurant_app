import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';

import '../provider/scheduling_provider.dart';
import '../widgets/custom_dialog.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/seetings-page';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return Material(
            child: ListTile(
              title: const Text('Scheduling Restaurant'),
              trailing: Consumer<SchedulingProvider>(
                builder: (context, scheduled, _) {
                  return Switch.adaptive(
                    value: provider.isDailyRestaurantActive,
                    onChanged: (value) async {
                      if (Platform.isIOS) {
                        customDialog(context);
                      } else {
                        scheduled.scheduledRestaurant(value);
                        provider.enableDailyRestaurant(value);
                      }
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

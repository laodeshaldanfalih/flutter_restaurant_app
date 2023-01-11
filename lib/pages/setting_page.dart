import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/scheduling_provider.dart';
import '../widgets/custom_dialog.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/seetings-page';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Material(
        child: ListTile(
          title: const Text('Scheduling News'),
          trailing: Consumer<SchedulingProvider>(
            builder: (context, scheduled, _) {
              return Switch.adaptive(
                value: scheduled.isScheduled,
                onChanged: (value) async {
                  if (Platform.isIOS) {
                    customDialog(context);
                  } else {
                    scheduled.scheduledNews(value);
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

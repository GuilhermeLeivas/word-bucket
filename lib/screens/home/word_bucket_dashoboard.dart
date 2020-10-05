import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_bucket/components/features_items_dashboard.dart';
import 'package:word_bucket/model/user_word_bucket.dart';
import 'package:word_bucket/screens/config/config_panel_function.dart';

class WordBucketDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserWordBucket>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.settings),
            label: Text(''),
            onPressed: () => showSettingsPanel(context),

          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user.email),
            ),
            FeaturesItemsDashboard()
          ],
        ),
      ),
    );
  }


}

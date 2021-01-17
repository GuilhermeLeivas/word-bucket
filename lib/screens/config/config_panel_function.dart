import 'package:flutter/material.dart';
import 'package:word_bucket/services/auth.dart';

void showSettingsPanel(BuildContext context) {
  final _authService = AuthService();

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Configurações',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text(
                    'Log out',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {
                    _authService.signOut();
                  },
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ]),
      );
    },
  );
}

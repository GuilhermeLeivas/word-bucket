import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_bucket/model/user_word_bucket.dart';
import 'package:word_bucket/screens/user/user_profile.dart';
import 'package:word_bucket/screens/home/home.dart';
import 'package:word_bucket/screens/words/words_list_panel.dart';
import 'package:word_bucket/services/auth.dart';

class WordBucketDashboard extends StatefulWidget {
  @override
  _WordBucketDashboardState createState() => _WordBucketDashboardState();
}

class _WordBucketDashboardState extends State<WordBucketDashboard> {
  int _currentIndex = 0;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserWordBucket>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Word bucket'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Log out'),
            onPressed: () => _authService.signOut(),
          ),
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            title: Text('Palavras'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Perfil'),
          ),
        ],
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }

  final _tabs = [Home(), WordsListPanel(), UserProfile()];
}

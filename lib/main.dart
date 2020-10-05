import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_bucket/screens/wrapper.dart';
import 'package:word_bucket/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WordBucketApp());
}

class WordBucketApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: AuthService().user,
        ),
      ],
      child: MaterialApp(
        title: 'A simple word store',
        theme: ThemeData.dark(),
        home: Wrapper(),
      ),
    );
  }
}

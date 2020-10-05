import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_bucket/model/user_word_bucket.dart';
import 'package:word_bucket/screens/auth/authenticate.dart';
import 'package:word_bucket/screens/home/word_bucket_dashoboard.dart';

class Wrapper extends StatelessWidget {
  // Este wiget fica responsavel por detectar se o usuario esta logado ou nao, dependendo da resposta ele manda ou para HOME ou para tela de login
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserWordBucket>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return WordBucketDashboard();
    }
  }
}

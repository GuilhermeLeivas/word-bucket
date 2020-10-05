import 'package:flutter/material.dart';
import 'package:word_bucket/screens/auth/register.dart';
import 'package:word_bucket/screens/auth/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInPage = true;

  void toggleView() {

    setState(() => showSignInPage = !showSignInPage); // Esta funcao nos permite a troca de tela entre sigin e signup
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignIn(toggleView : toggleView); // Passamos a funcao no construtor para que consigamos acessa-la dentro do wiget itself.
    } else {
      return Register(toggleView : toggleView);
    }
  }
}

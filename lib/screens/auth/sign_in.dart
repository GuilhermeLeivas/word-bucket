import 'package:flutter/material.dart';
import 'package:word_bucket/components/input_fields.dart';
import 'package:word_bucket/components/word_bucket_loading_component.dart';
import 'package:word_bucket/model/user_word_bucket.dart';
import 'package:word_bucket/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  final _inputEmail = TextEditingController();
  final _inputPassword = TextEditingController();

  String error = ''; // Para exibir uma mensagem de erro embaixo do form

  final _formKey = GlobalKey<FormState>(); // Nos da o estado do form

  bool isLoading = false; // Para exibir a tela de carregamento

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? WordBucketLoadingComponent()
        : Scaffold(
            appBar: AppBar(
              title: Text('Sign in'),
              actions: [
                FlatButton.icon(
                  icon: Icon(Icons.person_add),
                  label: Text('Registrar'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          size: 60,
                        ),
                      ),
                      WordBucketInputField(
                        labelText: 'Email',
                        hintText: 'Digite seu email',
                        hideCharacters: false,
                        inputController: _inputEmail,
                      ),
                      WordBucketInputField(
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        hideCharacters: true,
                        inputController: _inputPassword,
                      ),
                      RaisedButton(
                        child: Text('Log in'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => isLoading = true);

                            UserWordBucket userLogged =
                                await _authService.signInWithEmailAndPassword(
                                    _inputEmail.text, _inputPassword.text);
                            _verifyUserLogged(
                                userLogged); // Recebendo o usuario logado
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void _verifyUserLogged(UserWordBucket userWordBucket) {
    if (userWordBucket == null) {
      setState(() {
        error = 'Ocorreu um erro, tente novamente e verifique seus dados';
        isLoading = false;
      });
    }
  }
}

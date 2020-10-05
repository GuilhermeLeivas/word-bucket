import 'package:flutter/material.dart';
import 'package:word_bucket/components/input_fields.dart';
import 'package:word_bucket/components/word_bucket_loading_component.dart';
import 'package:word_bucket/services/auth.dart';
import 'package:word_bucket/services/database.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _inputEmail = TextEditingController();
  final _inputPassword = TextEditingController();

  String error = '';
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? WordBucketLoadingComponent()
        : Scaffold(
            appBar: AppBar(
              title: Text('Novo registro'),
              actions: [
                FlatButton.icon(
                  icon: Icon(Icons.person_add),
                  label: Text('Log in'),
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
                          Icons.person_add,
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
                        child: Text('Registrar'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => isLoading = true);
                            dynamic result =
                                await _authService.registerWithEmailAndPassword(
                                    _inputEmail.text, _inputPassword.text);
                            _verifyUserIntegrity(result);
                            _createUserData(result);
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void _verifyUserIntegrity(dynamic result) {
    if (result == null) {
      setState(() {
        error = 'Ocorreu um erro, por favor tente novamente mais tarde';
        isLoading = false;
      });
    }
  }

  void _createUserData(dynamic result) {
    DatabaseService(uid: result.uid).updateUserData();
  }
}

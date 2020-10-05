import 'package:flutter/material.dart';

class WordBucketInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool hideCharacters;
  final TextEditingController inputController;

  WordBucketInputField({this.labelText, this.hintText, this.hideCharacters, this.inputController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        obscureText: hideCharacters,
        controller: inputController,
        validator: (valorDoCampo) => valorDoCampo.isEmpty ? 'Campo não pode ser nulo' : null,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}

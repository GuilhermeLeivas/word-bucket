import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_bucket/components/word_bucket_loading_component.dart';
import 'package:word_bucket/model/dados_usuario.dart';
import 'package:word_bucket/model/user_word_bucket.dart';
import 'package:word_bucket/model/word.dart';
import 'package:word_bucket/services/database.dart';

class WordsListPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioLogado = Provider.of<UserWordBucket>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Suas palavras salvas'),
      ),
      body: StreamBuilder<DadosUsuario>(
          stream: DatabaseService(uid: usuarioLogado.uid).userDocument,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DadosUsuario dadosUsuario = snapshot.data;

              return SingleChildScrollView(child: WordList(dadosUsuario));
            }
            return WordBucketLoadingComponent();
          }),
    );
  }
}

class WordList extends StatefulWidget {
  final DadosUsuario dadosUsuario;

  WordList(this.dadosUsuario);

  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(
            () => widget.dadosUsuario.words[index].isExpanded = !isExpanded);
      },
      children: widget.dadosUsuario.words.map(
        (Word word) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    word.word,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                );
              },
              body: WordDetails(word),
              isExpanded: word.isExpanded);
        },
      ).toList(),
    );
  }
}

class WordDetails extends StatelessWidget {
  final Word word;
  final String _significado = 'Significado: ';
  final String _exemplo = 'Exemplo: ';
  final String _sinonimo = 'Sinônimo: ';

  WordDetails(this.word);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(_significado + word.meaning),
        ),
        ListTile(
          title: Text(_exemplo + word.exampleSentence),
        ),
        ListTile(
          title: Text(_sinonimo + word.synonyms),
        ),
      ],
    );
  }
}

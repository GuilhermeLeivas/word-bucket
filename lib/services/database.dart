import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:word_bucket/model/dados_usuario.dart';
import 'package:word_bucket/model/word.dart';

class DatabaseService {
  final CollectionReference wordBucketCollection = FirebaseFirestore.instance
      .collection(
          'word-bucket-database'); // Isto nos da a comunicacao com nossa database

  final String uid;

  DatabaseService({this.uid});

  Future updateUserData() async {
    wordBucketCollection.doc(uid).set({
      'userName': 'Novo usuario ' + uid,
      'words': [
        Word(
                word: 'We',
                meaning: 'Nos',
                synonyms: 'A gente',
                exampleSentence: 'We got in trouble last night')
            .toJson(),
        Word(
                word: 'You',
                meaning: 'Você',
                synonyms: 'TU',
                exampleSentence: 'You picked the wrong house fool')
            .toJson()
      ]
    });
  }

  // // Essa stream vai nos manter informados de quaisquer mudancas na colecao
  // Stream<List<DadosUsuario>> get recordsState {
  //   return wordBucketCollection.snapshots().map(_userDataFromQuerySnapshot);
  // }

  Stream<DadosUsuario> get userDocument {
    // Esta stream nos mantera informados somente do documento do usuario logado
    return wordBucketCollection
        .doc(uid)
        .snapshots()
        .map(_userDataFromDocumentSnapshot);
  }

  // List<DadosUsuario> _userDataFromQuerySnapshot(QuerySnapshot snapshot) {
  //   // Mapeamento para todos docs
  //   return snapshot.docs.map((doc) {
  //     return DadosUsuario(
  //         userName: doc.get('userName'), word: Word.fromJson(doc.get('word')));
  //   }).toList();
  // }

  DadosUsuario _userDataFromDocumentSnapshot(DocumentSnapshot userDocument) {
    List<dynamic> dynamicList = userDocument.get('words');
    _wordListFromMap(dynamicList);
    // Mapeamento para doc especifico
    return DadosUsuario(
        uid: uid, userName: userDocument.get('userName') ?? '',
        words: _wordListFromMap(dynamicList)
    );
  }

  List<Word> _wordListFromMap(List<dynamic> dynamicList) {

    try {
      List<Word> words = dynamicList.map((value) => Word.fromJson(value)).toList();
      return words;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

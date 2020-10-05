class Word {

  String word;
  String meaning;
  String synonyms;
  String exampleSentence;
  bool isExpanded;

  Word({this.word, this.meaning, this.synonyms, this.exampleSentence, this.isExpanded = false});

  Word.fromJson(Map<String, dynamic> json) :
        word = json['word'],
        meaning = json['meaning'],
        synonyms = json['synonyms'],
        exampleSentence = json['exampleSentence'],
        isExpanded = json['isExpanded'];

  Map<String, dynamic> toJson() => {

    'word': word,
    'meaning': meaning,
    'synonyms': synonyms,
    'exampleSentence': exampleSentence,
    'isExpanded' : isExpanded
  };
}
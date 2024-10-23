class TextAnalysisResult {
  final List<String> emojis;
  final List<String> specialCharacters;
  final List<String> htmlEntities;
  final List<String> accents;
  final String cleanedText;

  TextAnalysisResult({
    required this.emojis,
    required this.specialCharacters,
    required this.htmlEntities,
    required this.accents,
    required this.cleanedText,
  });

  @override
  String toString() {
    return '''
    Analyse du texte:
    - Emojis: $emojis
    - Caractères spéciaux: $specialCharacters
    - Entités HTML: $htmlEntities
    - Accents: $accents
    - Texte nettoyé: $cleanedText
    ''';
  }
}
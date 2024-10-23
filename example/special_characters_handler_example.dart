import 'package:special_characters_handler/special_characters_handler.dart';

void main() {
  /*print(CharacterUtils.isPunctuation('!')); // true
  print(CharacterUtils.isPunctuation('#')); // true
  print(CharacterUtils.isPunctuation('@')); // true
  print(CharacterUtils.isPunctuation('*')); // true
  print(CharacterUtils.isPunctuation('A')); // false

  // Test de conversion
  String text = "H'ello! @ World*";
  print(CharacterUtils.toUrlFriendly(text));


  final handler = SpecialCharactersHandler();
  String texte = "Hello 😊 World 🌍";

  // Utilisation du handler
  print(handler.containsEmoji(texte));         // true
  print(handler.extractEmojis(texte));         // ["😊", "🌍"]
  print(handler.containsEmoji(texte));           // 2

  // Utilisation des extensions String
  print(texte.containsEmoji());                // true
  print(texte.extractEmojis());                // ["😊", "🌍"]


  // Nettoyage avec options
  final cleaned = handler.clean(
      texte,
      options: CleaningOptions(removeEmojis: true)
  );
  print(cleaned);*/

  String texte = "Héllô 😊 &quot;Wórld&quot; 🌍 @#çà";

  final handler = SpecialCharactersHandler();

  // Vérification des caractères spéciaux
  if (handler.containsSpecialCharacters(texte)) {
    print("Le texte contient des caractères spéciaux");
  }

  // Analyse complète
  TextAnalysisResult analyse = texte.analyzeText();
  print(analyse);

  // Test des différents types de caractères
  print('Est un caractère spécial @: ${CharacterUtils.isPunctuation("@")}');
  print('Est un symbole ©: ${CharacterUtils.isSymbol("©")}');
  print('Est une lettre é: ${CharacterUtils.isLetter("é")}');
  print('Est un chiffre 5: ${CharacterUtils.isDigit("5")}');

  // Nettoyage
  String cleaned = handler.clean(texte, options: CleaningOptions(
    removeEmojis: true,
    removeHtmlEntities: true,
    convertAccents: true,
    normalizeUnicode: true,
  ));
  print('Texte nettoyé: $cleaned');

}

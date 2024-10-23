import 'package:characters/characters.dart';
import '../../special_characters_handler.dart';
import '../models/cleaning_options.dart';

class UnicodeService {
  String normalizeText(String input, CleaningOptions options) {
    if (!options.normalizeUnicode) return input;

    return input.characters.map((char) {
      if (CharacterUtils.isCombiningMark(char) && options.convertAccents) {
        return '';
      }
      return char;
    }).join();
  }

  String convertAccents(String input) {
    return CharacterUtils.stripAccents(input);
  }
}
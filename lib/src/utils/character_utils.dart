// lib/src/utils/character_utils.dart
import '../constants/unicode_patterns.dart';
import '../special_characters_handler_base.dart';

class CharacterUtils {
  // Expressions régulières pré-compilées
  static final RegExp _diacriticsRegExp = RegExp(UnicodePatterns.diacritics);
  static final RegExp _combiningMarksRegExp = RegExp(UnicodePatterns.combiningMarks);
  static final RegExp _nonPrintableRegExp = RegExp(UnicodePatterns.nonPrintable);
  static final RegExp _spacesRegExp = RegExp(UnicodePatterns.spaces);
  static final RegExp _letterRegExp = RegExp(r'[A-Za-zÀ-ÿ]');
  static final RegExp _digitRegExp = RegExp(r'[0-9]');
  static final RegExp _punctuationRegExp = RegExp(r'[!#$%&()*+,\-./:;<=>?@\[\]^`{|}~]');
  static final RegExp _symbolRegExp = RegExp(r'[§¨©ª«¬®¯°±²³´µ¶·¸¹º»¼½¾¿×÷]');

  static bool isDiacriticalMark(String char) {
    if (char.isEmpty) return false;
    return _diacriticsRegExp.hasMatch(char);
  }
  /// Vérifie si une chaîne contient des caractères spéciaux
  static bool containsSpecialCharacters(String input) {
    if (input.isEmpty) return false;

    return input.split('').any((char) =>
    isPunctuation(char) ||
        isSymbol(char) ||
        isDiacriticalMark(char) ||
        isCombiningMark(char)
    );
  }

  static bool isCombiningMark(String char) {
    if (char.isEmpty) return false;
    return _combiningMarksRegExp.hasMatch(char);
  }

  static bool isNonPrintable(String char) {
    if (char.isEmpty) return false;
    return _nonPrintableRegExp.hasMatch(char);
  }

  static String normalizeCharacter(String char) {
    if (char.isEmpty) return char;
    if (isDiacriticalMark(char) || isCombiningMark(char)) {
      return '';
    }
    return char;
  }

  static String stripAccents(String text) {
    if (text.isEmpty) return text;

    var result = text;

    // Application des remplacements définis dans UnicodePatterns
    UnicodePatterns.accentMap.forEach((key, value) {
      result = result.replaceAll(key, value);
    });

    // Suppression des marques combinantes
    result = result.replaceAll(_combiningMarksRegExp, '');

    return result;
  }

  static bool isLetter(String char) {
    if (char.isEmpty) return false;
    return _letterRegExp.hasMatch(char);
  }

  static bool isDigit(String char) {
    if (char.isEmpty) return false;
    return _digitRegExp.hasMatch(char);
  }

  static bool isWhitespace(String char) {
    if (char.isEmpty) return false;
    return _spacesRegExp.hasMatch(char);
  }

  static bool isPunctuation(String char) {
    if (char.isEmpty) return false;
    return _punctuationRegExp.hasMatch(char);
  }

  static bool isSymbol(String char) {
    if (char.isEmpty) return false;
    return _symbolRegExp.hasMatch(char);
  }

  static bool isControl(String char) {
    if (char.isEmpty) return false;
    final code = char.codeUnitAt(0);
    return code < 32 || (code >= 127 && code < 160);
  }

  static bool isPrintable(String char) {
    return !isControl(char) && !isNonPrintable(char);
  }

  static String toBasicString(String text) {
    if (text.isEmpty) return text;

    return text
        .split('')
        .where((char) => isLetter(char) || isDigit(char) || isWhitespace(char))
        .join('');
  }

  static String toUrlFriendly(String text) {
    if (text.isEmpty) return text;

    var result = SpecialCharactersHandler().removeOnlyEmojis(text);
    result = stripAccents(result.toLowerCase());
    result = result.replaceAll(_punctuationRegExp, '-');
    result = result.replaceAll(_symbolRegExp, '');
    result = result.replaceAll(_spacesRegExp, '-');

    // Supprimer les tirets multiples
    while (result.contains('--')) {
      result = result.replaceAll('--', '-');
    }

    // Supprimer les tirets au début et à la fin
    return result.trim().replaceAll(RegExp(r'^-+|-+$'), '');
  }
}
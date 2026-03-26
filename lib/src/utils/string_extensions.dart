import 'package:characters/characters.dart';
import '../models/cleaning_options.dart';
import '../special_characters_handler_base.dart';
import '../services/emoji_service.dart';
import 'character_utils.dart';

extension SpecialCharactersStringExtensions on String {
  // --- Original StringUtils ---
  bool isNullOrEmpty() => this.isEmpty;

  bool isNullOrWhiteSpace() => this.trim().isEmpty;

  String truncate(int maxLength, {String suffix = '...'}) {
    if (this.length <= maxLength) return this;
    return '${this.substring(0, maxLength)}$suffix';
  }

  String removeNonPrintableCharacters() {
    return this.replaceAll(RegExp(r'[\x00-\x1F\x7F-\x9F]'), '');
  }

  String normalizeSpaces() {
    return this.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  // --- From SpecialCharactersHandlerExtension ---
  TextAnalysisResult analyzeText() {
    return SpecialCharactersHandler().analyzeText(this);
  }

  String cleanSpecialCharacters({CleaningOptions? options}) {
    return SpecialCharactersHandler().clean(this, options: options);
  }

  String removeOnlyEmojis() {
    return SpecialCharactersHandler().removeOnlyEmojis(this);
  }

  String removeOnlySpecialCharacters() {
    return SpecialCharactersHandler().removeOnlySpecialCharacters(this);
  }

  String removeOnlyAccents() {
    return SpecialCharactersHandler().removeOnlyAccents(this);
  }

  String removeOnlyHtmlEntities() {
    return SpecialCharactersHandler().removeOnlyHtmlEntities(this);
  }

  bool hasSpecialCharacters() {
    return SpecialCharactersHandler().containsSpecialCharacters(this);
  }

  // --- From EmojiExtension ---
  /// Supprime les emojis du texte
  String removeEmojis() {
    return EmojiService().removeEmojis(this);
  }

  /// Vérifie si le texte contient des emojis
  bool hasEmojis() {
    return EmojiService().hasEmoji(this);
  }

  bool containsEmoji() {
    return SpecialCharactersHandler().containsEmoji(this);
  }

  List<String> extractEmojis() {
    return SpecialCharactersHandler().extractEmojis(this);
  }

  /// Convertit une chaîne en slug (URL friendly)
  String toSlug() {
    return CharacterUtils.toUrlFriendly(this);
  }
}

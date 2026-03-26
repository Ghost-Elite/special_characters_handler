// lib/src/special_characters_handler_base.dart

import 'dart:collection';
import 'package:meta/meta.dart';
import 'package:characters/characters.dart';

import 'config/special_characters_config.dart';
import 'models/cleaning_options.dart';
import 'models/replacement_rule.dart';
import 'services/unicode_service.dart';
import 'services/html_service.dart';
import 'services/emoji_service.dart';
import 'utils/character_utils.dart';
import 'constants/html_entities.dart';
import 'constants/unicode_patterns.dart';
import 'constants/emoji_patterns.dart';

/// Résultat de l'analyse de texte
class TextAnalysisResult {
  final List<String> emojis;
  final List<String> specialCharacters;
  final List<String> htmlEntities;
  final List<String> accents;
  final List<String> youtubeUrls;
  final String cleanedText;
  final int originalLength;
  final int cleanedLength;

  TextAnalysisResult({
    required this.emojis,
    required this.specialCharacters,
    required this.htmlEntities,
    required this.accents,
    required this.youtubeUrls,
    required this.cleanedText,
    required this.originalLength,
    required this.cleanedLength,
  });

  @override
  String toString() {
    return '''
    Analyse du texte:
    - Longueur originale: $originalLength
    - Longueur après nettoyage: $cleanedLength
    - Emojis (${emojis.length}): $emojis
    - Caractères spéciaux (${specialCharacters.length}): $specialCharacters
    - Entités HTML (${htmlEntities.length}): $htmlEntities
    - Accents (${accents.length}): $accents
    - URLs YouTube (${youtubeUrls.length}): $youtubeUrls
    - Texte nettoyé: "$cleanedText"
    ''';
  }
}

/// Une classe singleton qui gère le nettoyage des caractères spéciaux
class SpecialCharactersHandler {
  // Singleton pattern
  static final SpecialCharactersHandler _instance = SpecialCharactersHandler._internal();
  factory SpecialCharactersHandler() => _instance;

  // Services
  late final UnicodeService _unicodeService;
  late final HtmlService _htmlService;
  late final EmojiService _emojiService;

  // Cache pour les opérations fréquentes
  final _cache = HashMap<String, String>();

  // Règles de remplacement personnalisées
  final List<ReplacementRule> _customRules = [];

  // Constructeur privé
  SpecialCharactersHandler._internal() {
    _initializeServices();
    _initializeDefaultRules();
  }

  /// Initialise les services nécessaires
  void _initializeServices() {
    _unicodeService = UnicodeService();
    _htmlService = HtmlService();
    _emojiService = EmojiService();
  }

  /// Initialise les règles de remplacement par défaut
  void _initializeDefaultRules() {
    // Les entités HTML sont gérées par HtmlService qui utilise html_unescape
    // On n'ajoute ici que les règles qui ne sont pas couvertes par les services
    // ou qui nécessitent un traitement spécifique.

    // Ajout des règles Unicode pour les accents si nécessaire par défaut
    // Note: UnicodeService gère déjà cela via convertAccents
  }

  /// Analyse complète du texte
  TextAnalysisResult analyzeText(String input) {
    if (input.isEmpty) {
      return TextAnalysisResult(
        emojis: [],
        specialCharacters: [],
        htmlEntities: [],
        accents: [],
        youtubeUrls: [],
        cleanedText: input,
        originalLength: 0,
        cleanedLength: 0,
      );
    }

    // Trouver les emojis
    List<String> emojis = _emojiService.findEmojis(input);

    // Trouver les caractères spéciaux
    Set<String> specialChars = {};
    input.split('').forEach((char) {
      if (CharacterUtils.isPunctuation(char) || CharacterUtils.isSymbol(char)) {
        specialChars.add(char);
      }
    });

    // Trouver les entités HTML
    List<String> htmlEntities = [];
    for (var entity in HtmlEntities.common.keys) {
      if (input.contains(entity)) {
        htmlEntities.add(entity);
      }
    }

    // Trouver les accents
    List<String> accents = [];
    input.split('').forEach((char) {
      if (UnicodePatterns.accentMap.containsKey(char)) {
        accents.add(char);
      }
    });

    // Trouver les URLs YouTube
    List<String> youtubeUrls = _htmlService.extractYouTubeUrls(input);

    // Nettoyer le texte
    String cleanedText = clean(input, options: CleaningOptions(
      removeEmojis: true,
      removeHtmlEntities: true,
      convertAccents: true,
      normalizeUnicode: true,
      removeSpecialChars: true,
    ));

    return TextAnalysisResult(
      emojis: emojis,
      specialCharacters: specialChars.toList(),
      htmlEntities: htmlEntities,
      accents: accents,
      youtubeUrls: youtubeUrls,
      cleanedText: cleanedText,
      originalLength: input.length,
      cleanedLength: cleanedText.length,
    );
  }

  /// Nettoie le texte en appliquant toutes les transformations configurées
  String clean(String input, {CleaningOptions? options}) {
    if (input.isEmpty) return input;
    options ??= const CleaningOptions();

    if (input.length > SpecialCharactersConfig.maxInputLength) {
      throw ArgumentError('Input text exceeds maximum length');
    }

    final cacheKey = _generateCacheKey(input, options);
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    try {
      var result = input;

      if (options.removeHtmlEntities) {
        result = _htmlService.cleanHtmlEntities(result, options);
      }

      if (options.removeEmojis) {
        result = _emojiService.removeEmojis(result);
      }

      if (options.normalizeUnicode) {
        result = _unicodeService.normalizeText(result, options);
      }

      if (options.convertAccents) {
        result = _unicodeService.convertAccents(result);
      }

      if (options.removeMarkdown) {
        result = _stripMarkdown(result);
      }

      result = _applyCustomRules(result, options);

      if (!options.preserveNewlines) {
        result = result.replaceAll(RegExp(r'\s+'), ' ').trim();
      }

      _updateCache(cacheKey, result);

      return result;
    } catch (e) {
      if (SpecialCharactersConfig.enableLogging) {
        print('Error cleaning text: $e');
      }
      rethrow;
    }
  }

  /// Nettoie uniquement les emojis
  String removeOnlyEmojis(String input) {
    return _emojiService.removeEmojis(input);
  }

  /// Nettoie uniquement les caractères spéciaux
  String removeOnlySpecialCharacters(String input) {
    return input.split('')
        .where((char) => !CharacterUtils.isPunctuation(char) &&
        !CharacterUtils.isSymbol(char))
        .join('');
  }

  /// Nettoie uniquement les accents
  String removeOnlyAccents(String input) {
    return _unicodeService.convertAccents(input);
  }

  /// Nettoie uniquement les entités HTML
  String removeOnlyHtmlEntities(String input) {
    return _htmlService.cleanHtmlEntities(
        input,
        CleaningOptions(removeHtmlEntities: true)
    );
  }

  // ... Autres méthodes d'utilité

  String _stripMarkdown(String input) {
    if (input.isEmpty) return input;
    var result = input;

    // Supprimer les liens [texte](url) -> texte
    result = result.replaceAllMapped(RegExp(r'\[([^\]]+)\]\([^\)]+\)'), (match) => match.group(1) ?? '');

    // Supprimer le gras et l'italique
    result = result.replaceAllMapped(RegExp(r'(\*\*|__)(.*?)\1'), (match) => match.group(2) ?? '');
    result = result.replaceAllMapped(RegExp(r'(\*|_)(.*?)\1'), (match) => match.group(2) ?? '');
    // Version plus robuste si le précédent échoue sur certains cas
    result = result.replaceAll(RegExp(r'\*\*|__|[\*_]'), '');

    // Supprimer les titres #, ##, etc.
    result = result.replaceAll(RegExp(r'^#+\s*', multiLine: true), '');

    // Supprimer les blocs de code (on garde le contenu)
    result = result.replaceAllMapped(RegExp(r'```[\s\S]*?\n?([\s\S]*?)```'), (match) => match.group(1) ?? '');
    result = result.replaceAllMapped(RegExp(r'`([^`]+)`'), (match) => match.group(1) ?? '');

    return result;
  }

  String _applyCustomRules(String input, CleaningOptions options) {
    var result = input;
    for (final rule in _customRules) {
      if (rule.isRegex) {
        result = result.replaceAll(rule.regexPattern, rule.replacement);
      } else {
        result = result.replaceAll(rule.pattern, rule.replacement);
      }
    }
    return result;
  }

  String _generateCacheKey(String input, CleaningOptions options) {
    return '$input:${options.hashCode}';
  }

  void _updateCache(String key, String value) {
    if (_cache.length >= SpecialCharactersConfig.cacheSize) {
      _cache.remove(_cache.keys.first);
    }
    _cache[key] = value;
  }

  void _clearCache() {
    _cache.clear();
  }

  bool containsSpecialCharacters(String input) {
    return CharacterUtils.containsSpecialCharacters(input);
  }

  bool containsEmoji(String input) {
    return _emojiService.hasEmoji(input);
  }

  List<String> extractEmojis(String input) {
    return _emojiService.findEmojis(input);
  }

  /// Extrait toutes les URLs YouTube du texte
  List<String> extractYouTubeUrls(String input) {
    return _htmlService.extractYouTubeUrls(input);
  }

  @visibleForTesting
  void dispose() {
    _clearCache();
    _customRules.clear();
  }
}

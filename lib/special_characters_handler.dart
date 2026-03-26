
library special_characters_handler;

import 'package:special_characters_handler/special_characters_handler.dart';

// Export des classes principales
export 'src/special_characters_handler_base.dart';

// Export des modèles
export 'src/models/cleaning_options.dart';
export 'src/models/replacement_rule.dart';

// Export des services
export 'src/services/unicode_service.dart';
export 'src/services/html_service.dart';
export 'src/services/emoji_service.dart';

// Export des constantes
export 'src/constants/html_entities.dart';
export 'src/constants/unicode_patterns.dart';
export 'src/constants/emoji_patterns.dart';

// Export des configurations
export 'src/config/special_characters_config.dart';

// Export des utilitaires
export 'src/utils/string_extensions.dart';
export 'src/utils/character_utils.dart';

/// Version actuelle du package
const String packageVersion = '1.0.0';

/// Documentation rapide des fonctionnalités principales
///
/// Pour nettoyer un texte avec les options par défaut :
/// ```dart
/// String cleaned = "Héllô world".cleanSpecialCharacters();
/// ```
///
/// Pour utiliser des options personnalisées :
/// ```dart
/// final options = CleaningOptions(
///   removeHtmlEntities: true,
///   removeEmojis: true,
///   normalizeUnicode: true,
///   convertAccents: true,
/// );
///
/// String cleaned = text.cleanSpecialCharacters(options: options);
/// ```
///
/// Pour utiliser directement le handler :
/// ```dart
/// final handler = SpecialCharactersHandler();
/// String cleaned = handler.clean(text);
/// ```
///
/// Pour ajouter des règles personnalisées :
/// ```dart
/// handler.addReplacementRule(ReplacementRule(
///   pattern: r'[0-9]+',
///   replacement: '#',
///   isRegex: true,
/// ));
/// ```
///
/// Pour extraire les emojis :
/// ```dart
/// List<String> emojis = "Hello 😊 World".extractEmojis();
/// ```
///
/// Pour vérifier la présence de caractères spéciaux :
/// ```dart
/// bool hasSpecial = "Héllô".hasSpecialCharacters();
/// ```

// Fonctions utilitaires globales si nécessaire
/// Vérifie si la version du package est compatible
bool isCompatibleVersion(String requiredVersion) {
  // Simple vérification de version
  return packageVersion.startsWith(requiredVersion);
}

/// Configurations globales du package
class SpecialCharactersHandlerConfig {
  /// Version minimale supportée de Dart SDK
  static const String minSdkVersion = '3.0.0';

  /// Version maximale supportée de Dart SDK
  static const String maxSdkVersion = '4.0.0';

  /// Vérifie si la version du SDK est supportée
  static bool isSdkVersionSupported(String sdkVersion) {
    // Logique de vérification de version
    return sdkVersion.compareTo(minSdkVersion) >= 0 &&
        sdkVersion.compareTo(maxSdkVersion) < 0;
  }
}

/// Énumération des types de nettoyage disponibles
enum CleaningType {
  /// Nettoie uniquement les entités HTML
  htmlOnly,

  /// Nettoie uniquement les emojis
  emojisOnly,

  /// Nettoie uniquement les caractères accentués
  accentsOnly,

  /// Nettoie tous les types de caractères spéciaux
  all,
}

/// Énumération des niveaux de nettoyage
enum CleaningLevel {
  /// Nettoyage léger (conserve la plupart des caractères spéciaux)
  light,

  /// Nettoyage moyen (équilibré)
  medium,

  /// Nettoyage agressif (supprime tous les caractères spéciaux)
  aggressive,
}

// Extensions supplémentaires si nécessaire
extension CleaningTypeExtension on CleaningType {
  /// Convertit le type de nettoyage en options
  CleaningOptions toOptions() {
    switch (this) {
      case CleaningType.htmlOnly:
        return const CleaningOptions(
          removeHtmlEntities: true,
          removeEmojis: false,
          normalizeUnicode: false,
          convertAccents: false,
        );
      case CleaningType.emojisOnly:
        return const CleaningOptions(
          removeHtmlEntities: false,
          removeEmojis: true,
          normalizeUnicode: false,
          convertAccents: false,
        );
      case CleaningType.accentsOnly:
        return const CleaningOptions(
          removeHtmlEntities: false,
          removeEmojis: false,
          normalizeUnicode: true,
          convertAccents: true,
        );
      case CleaningType.all:
        return const CleaningOptions(
          removeHtmlEntities: true,
          removeEmojis: true,
          normalizeUnicode: true,
          convertAccents: true,
        );
    }
  }
}

extension CleaningLevelExtension on CleaningLevel {
  /// Convertit le niveau de nettoyage en options
  CleaningOptions toOptions() {
    switch (this) {
      case CleaningLevel.light:
        return const CleaningOptions(
          removeHtmlEntities: true,
          removeEmojis: false,
          normalizeUnicode: false,
          convertAccents: false,
        );
      case CleaningLevel.medium:
        return const CleaningOptions(
          removeHtmlEntities: true,
          removeEmojis: true,
          normalizeUnicode: true,
          convertAccents: false,
        );
      case CleaningLevel.aggressive:
        return const CleaningOptions(
          removeHtmlEntities: true,
          removeEmojis: true,
          normalizeUnicode: true,
          convertAccents: true,
          removeSpecialChars: true,
        );
    }
  }
}
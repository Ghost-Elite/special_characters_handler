class SpecialCharactersConfig {
  static const int maxInputLength = 1000000;  // Limite de taille d'entrée
  static const bool enableLogging = true;     // Activation des logs
  static const int cacheSize = 1000;          // Taille du cache

  // Configuration par défaut pour le nettoyage
  static const Map<String, bool> defaultCleaningRules = {
    'removeHtmlEntities': true,
    'removeEmojis': true,
    'normalizeUnicode': true,
    'convertAccents': true,
    'removeSpecialChars': true,
    'preserveNewlines': true,
  };

  // Timeouts
  static const Duration operationTimeout = Duration(seconds: 30);
}


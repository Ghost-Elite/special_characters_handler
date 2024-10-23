class UnicodePatterns {
  /// Expression régulière pour les marques diacritiques
  static const String diacritics = r'[\u0300-\u036f]';

  /// Expression régulière pour les marques combinantes
  static const String combiningMarks = r'[\u0300-\u036F\u1AB0-\u1AFF\u1DC0-\u1DFF\u20D0-\u20FF\uFE20-\uFE2F]';

  /// Expression régulière pour les caractères non imprimables
  static const String nonPrintable = r'[\x00-\x1F\x7F-\x9F]';

  /// Expression régulière pour les espaces
  static const String spaces = r'[\s\u00A0\u1680\u2000-\u200A\u2028\u2029\u202F\u205F\u3000]';

  /// Table de conversion des caractères accentués
  static const Map<String, String> accentMap = {
    'á': 'a', 'à': 'a', 'ã': 'a', 'â': 'a', 'ä': 'a',
    'é': 'e', 'è': 'e', 'ê': 'e', 'ë': 'e',
    'í': 'i', 'ì': 'i', 'î': 'i', 'ï': 'i',
    'ó': 'o', 'ò': 'o', 'õ': 'o', 'ô': 'o', 'ö': 'o',
    'ú': 'u', 'ù': 'u', 'û': 'u', 'ü': 'u',
    'ý': 'y', 'ÿ': 'y',
    'ñ': 'n',
    'ç': 'c',
  };
}
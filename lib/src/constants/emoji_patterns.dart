// lib/src/constants/emoji_patterns.dart

class EmojiPatterns {
  /// Pattern Unicode de base pour les emojis
  static const String emojiPattern =
      r'[\u{1F300}-\u{1F9FF}]' // Emoticônes étendus
      r'|[\u{1F600}-\u{1F64F}]' // Emoticônes
      r'|[\u{2600}-\u{26FF}]'   // Symboles divers
      r'|[\u{2700}-\u{27BF}]'   // Symboles Dingbats
      r'|[\u{1F900}-\u{1F9FF}]' // Symboles supplémentaires
      r'|[\u{1F1E0}-\u{1F1FF}]' // Drapeaux régionaux
      r'|[\u{1F191}-\u{1F251}]' // Symboles encadrés
      r'|[\u{1F004}-\u{1F0CF}]' // Symboles de cartes
      r'|[\u{1F170}-\u{1F251}]' // Symboles encadrés alphabétiques
      r'|[\u{1F300}-\u{1F5FF}]' // Symboles et pictogrammes
      r'|[\u{1F600}-\u{1F64F}]' // Emoticônes
      r'|[\u{1F680}-\u{1F6FF}]' // Symboles de transport
      r'|[\u{1F700}-\u{1F77F}]' // Symboles alchimiques
      r'|[\u{1F780}-\u{1F7FF}]' // Symboles géométriques
      r'|[\u{1F800}-\u{1F8FF}]' // Flèches supplémentaires
      r'|[\u{1F900}-\u{1F9FF}]' // Symboles supplémentaires
      r'|[\u{1FA00}-\u{1FA6F}]' // Symboles de jeux de société
      r'|[\u{1FA70}-\u{1FAFF}]' // Symboles d'émoji
      r'|\u200D'; // Zero Width Joiner

  /// Catégories d'emojis communes
  static const Map<String, String> emojiCategories = {
    'smileys': r'[\u{1F600}-\u{1F64F}]',
    'people': r'[\u{1F466}-\u{1F478}]',
    'animals': r'[\u{1F400}-\u{1F4D3}]',
    'food': r'[\u{1F32D}-\u{1F37F}]',
    'travel': r'[\u{1F680}-\u{1F6FF}]',
    'activities': r'[\u{1F3A0}-\u{1F3FF}]',
    'objects': r'[\u{1F4A0}-\u{1F4FF}]',
    'symbols': r'[\u{1F300}-\u{1F5FF}]',
    'flags': r'[\u{1F1E0}-\u{1F1FF}]'
  };

  /// Exemples d'emojis pour les tests
  static const Map<String, String> testEmojis = {
    'smiley': '😀',
    'heart': '❤️',
    'family': '👨‍👩‍👧‍👦',
    'animal': '🐶',
    'food': '🍕',
    'activity': '⚽',
    'travel': '✈️',
    'object': '📱',
    'symbol': '⚠️',
    'flag': '🏳️'
  };
}
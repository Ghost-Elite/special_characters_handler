

class EmojiService {
  // Pattern pour les emojis
  static final RegExp _emojiRegExp = RegExp(
    r'[\u{1F300}-\u{1F9FF}]|[\u{2600}-\u{26FF}]|[\u{2700}-\u{27BF}]',
    unicode: true,
  );

  /// Supprime les emojis d'un texte
  String removeEmojis(String input) {
    if (input.isEmpty) return input;
    return input.replaceAll(_emojiRegExp, '');
  }

  /// Vérifie si un texte contient des emojis
  bool hasEmoji(String input) {
    return _emojiRegExp.hasMatch(input);
  }

  /// Trouve et extrait tous les emojis d'un texte
  List<String> findEmojis(String input) {
    if (input.isEmpty) return [];
    return _emojiRegExp.allMatches(input)
        .map((m) => m.group(0) ?? '')
        .where((s) => s.isNotEmpty)
        .toList();
  }

  /// Compte le nombre d'emojis dans un texte
  int countEmojis(String input) {
    if (input.isEmpty) return 0;
    return findEmojis(input).length;
  }
}

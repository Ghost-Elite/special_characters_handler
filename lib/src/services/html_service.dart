import 'package:html_unescape/html_unescape.dart';
import '../models/cleaning_options.dart';

class HtmlService {
  final _htmlUnescape = HtmlUnescape();

  String cleanHtmlEntities(String input, CleaningOptions options) {
    if (!options.removeHtmlEntities) return input;

    String result = _htmlUnescape.convert(input);

    // Nettoyage supplémentaire des balises HTML si présentes
    if (options.stripHtmlTags) {
      result = result.replaceAll(RegExp(r'<[^>]*>'), '');
    }

    return result;
  }

  /// Extrait toutes les URLs YouTube (embed, watch, youtu.be) d'un texte HTML
  List<String> extractYouTubeUrls(String input) {
    if (input.isEmpty) return [];

    final youtubeRegex = RegExp(
      r'(https?://)?(www\.)?(youtube\.com/watch\?v=|youtu\.be/|youtube\.com/embed/)([a-zA-Z0-9_-]{11})',
      caseSensitive: false,
      multiLine: true,
    );

    return youtubeRegex.allMatches(input)
        .map((m) => m.group(0) ?? '')
        .where((s) => s.isNotEmpty)
        .toList();
  }
}
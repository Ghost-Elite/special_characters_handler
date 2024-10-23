import 'package:html_unescape/html_unescape.dart';
import '../models/cleaning_options.dart';

class HtmlService {
  final _htmlUnescape = HtmlUnescape();

  String cleanHtmlEntities(String input, CleaningOptions options) {
    if (!options.removeHtmlEntities) return input;

    String result = _htmlUnescape.convert(input);

    // Nettoyage supplémentaire des balises HTML si présentes
    result = result.replaceAll(RegExp(r'<[^>]*>'), '');

    return result;
  }
}
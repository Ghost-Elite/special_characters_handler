import 'package:characters/characters.dart';
import '../models/cleaning_options.dart';

extension StringUtils on String {
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
}

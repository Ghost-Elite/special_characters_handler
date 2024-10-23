import 'package:meta/meta.dart';

@immutable
class CleaningOptions {
  final bool removeHtmlEntities;
  final bool removeEmojis;
  final bool normalizeUnicode;
  final bool convertAccents;
  final bool removeSpecialChars;
  final bool preserveNewlines;

  const CleaningOptions({
    this.removeHtmlEntities = true,
    this.removeEmojis = true,
    this.normalizeUnicode = true,
    this.convertAccents = true,
    this.removeSpecialChars = true,
    this.preserveNewlines = true,
  });

  CleaningOptions copyWith({
    bool? removeHtmlEntities,
    bool? removeEmojis,
    bool? normalizeUnicode,
    bool? convertAccents,
    bool? removeSpecialChars,
    bool? preserveNewlines,
  }) {
    return CleaningOptions(
      removeHtmlEntities: removeHtmlEntities ?? this.removeHtmlEntities,
      removeEmojis: removeEmojis ?? this.removeEmojis,
      normalizeUnicode: normalizeUnicode ?? this.normalizeUnicode,
      convertAccents: convertAccents ?? this.convertAccents,
      removeSpecialChars: removeSpecialChars ?? this.removeSpecialChars,
      preserveNewlines: preserveNewlines ?? this.preserveNewlines,
    );
  }
}
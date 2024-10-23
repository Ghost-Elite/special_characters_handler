import 'package:meta/meta.dart';

@immutable
class ReplacementRule {
  final String pattern;
  final String replacement;
  final bool isRegex;
  final bool caseSensitive;
  final String? category;

  const ReplacementRule({
    required this.pattern,
    required this.replacement,
    this.isRegex = false,
    this.caseSensitive = true,
    this.category,
  });

  RegExp get regexPattern => RegExp(
    pattern,
    caseSensitive: caseSensitive,
    unicode: true,
    multiLine: true,
  );
}
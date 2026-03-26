import 'package:special_characters_handler/special_characters_handler.dart';
import 'package:test/test.dart';

void main() {
  group('SpecialCharactersHandler Basic Tests', () {
    final handler = SpecialCharactersHandler();

    test('Clean accents', () {
      expect(handler.clean('Héllô'), equals('Hello'));
    });

    test('Clean emojis', () {
      expect(handler.clean('Hello 😊'), equals('Hello '));
    });

    test('Clean HTML entities', () {
      expect(handler.clean('Hello &quot;world&quot;'), equals('Hello "world"'));
    });

    test('Extension methods', () {
      expect('Héllô 😊'.cleanSpecialCharacters(), equals('Hello '));
    });

    test('toSlug()', () {
      expect('Mon Super Article ! 😊'.toSlug(), equals('mon-super-article'));
    });

    test('Markdown removal', () {
      final text = '# Title\n**Bold** and [link](url)';
      final cleaned = text.cleanSpecialCharacters(
        options: CleaningOptions(removeMarkdown: true, preserveNewlines: false)
      );
      expect(cleaned, equals('Title Bold and link'));
    });

    test('Consolidated extensions', () {
      expect('😊'.hasEmojis(), isTrue);
      expect('Hello'.hasEmojis(), isFalse);
      expect('😊'.extractEmojis(), equals(['😊']));
      expect('Héllô'.removeOnlyAccents(), equals('Hello'));
    });

    group('Consistency tests', () {
      final handler = SpecialCharactersHandler();
      test('Redundant HTML should work', () {
        // &quot; is in HtmlEntities.common and handled by HtmlUnescape
        expect(handler.clean('&quot;test&quot;'), equals('"test"'));
      });
    });
  });
}

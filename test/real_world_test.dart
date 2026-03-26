import 'package:special_characters_handler/special_characters_handler.dart';
import 'package:test/test.dart';

void main() {
  group('Real World Scenarios', () {
    final handler = SpecialCharactersHandler();

    test('Modern Web Content (HTML + Emojis + Accents)', () {
      const input = 'L\'été est là ! ☀️ Profitez-en sur &lt;a href="https://example.com"&gt;notre site&lt;/a&gt; &amp; restez "cool".';
      
      final cleaned = input.cleanSpecialCharacters(
        options: CleaningOptions(
          removeEmojis: true,
          removeHtmlEntities: true,
          convertAccents: true,
          stripHtmlTags: false,
        )
      );
      
      // Expected: L'ete est la !  Profitez-en sur <a href="https://example.com">notre site</a> & restez "cool".
      expect(cleaned, contains("L'ete est la !"));
      expect(cleaned, contains('<a href="https://example.com">notre site</a>'));
      expect(cleaned, contains('& restez "cool"'));
      expect(cleaned, isNot(contains('☀️')));
    });

    test('Social Media Post with Hashtags and Mentions', () {
      const input = 'Incroyable ! 😍 #Vacances #Soleil @mon_ami, tu viens ? 🌴🌊';
      
      final result = input.analyzeText();
      
      expect(result.emojis, containsAll(['😍', '🌴', '🌊']));
      expect(result.specialCharacters, containsAll(['#', '@', ',']));
      
      final slug = input.toSlug();
      expect(slug, equals('incroyable-vacances-soleil-mon-ami-tu-viens'));
    });

    test('Data from Legacy Systems (Mixed Encodings)', () {
      // Common issue: double encoded or mixed characters
      const input = 'R&eacute;sum&eacute; de l\'activit&eacute; : 100&euro; offerts !';
      
      final cleaned = handler.clean(input, options: CleaningOptions(removeHtmlEntities: true, convertAccents: true));
      
      expect(cleaned, equals("Resume de l'activite : 100€ offerts !"));
    });

    test('YouTube Video Descriptions with Links', () {
      const input = '''
Check out this amazing video! 🚀
Link: https://www.youtube.com/watch?v=dQw4w9WgXcQ
Also follow us on Twitter: @example
''';
      
      final youtubeUrls = input.extractYouTubeUrls();
      expect(youtubeUrls, hasLength(1));
      expect(youtubeUrls.first, equals('https://www.youtube.com/watch?v=dQw4w9WgXcQ'));
      
      final noEmoji = input.cleanSpecialCharacters(options: CleaningOptions(removeEmojis: true));
      expect(noEmoji, isNot(contains('🚀')));
    });

    test('Markdown Documentation Cleaning', () {
      const input = '''
# Get Started
To install, run `npm install`.
Check [documentation](https://docs.com) for more info.
> Note: use it carefully!
''';
      
      final cleaned = input.cleanSpecialCharacters(
        options: CleaningOptions(
          removeMarkdown: true,
          preserveNewlines: true,
        )
      );
      
      expect(cleaned, contains('Get Started'));
      expect(cleaned, contains('To install, run npm install.'));
      expect(cleaned, contains('Check documentation for more info.'));
      expect(cleaned, contains('Note: use it carefully!'));
      expect(cleaned, isNot(contains('# ')));
      expect(cleaned, isNot(contains('`')));
      expect(cleaned, isNot(contains('[documentation]')));
    });
  });
}

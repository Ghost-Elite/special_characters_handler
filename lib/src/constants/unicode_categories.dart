// lib/src/constants/unicode_categories.dart
// Catégories de lettres
const int UPPERCASE_LETTER = 1;
const int LOWERCASE_LETTER = 2;
const int TITLECASE_LETTER = 3;
const int MODIFIER_LETTER = 4;
const int OTHER_LETTER = 5;

// Catégories de marques
const int NON_SPACING_MARK = 6;
const int SPACING_MARK = 7;
const int ENCLOSING_MARK = 8;

// Catégories de nombres
const int DECIMAL_DIGIT_NUMBER = 9;
const int LETTER_NUMBER = 10;
const int OTHER_NUMBER = 11;

// Catégories de séparateurs
const int SPACE_SEPARATOR = 12;
const int LINE_SEPARATOR = 13;
const int PARAGRAPH_SEPARATOR = 14;

// Catégories de ponctuation
const int DASH_PUNCTUATION = 15;
const int START_PUNCTUATION = 16;
const int END_PUNCTUATION = 17;
const int CONNECTOR_PUNCTUATION = 18;
const int OTHER_PUNCTUATION = 19;
const int INITIAL_PUNCTUATION = 20;
const int FINAL_PUNCTUATION = 21;

// Catégories de symboles
const int MATH_SYMBOL = 22;
const int CURRENCY_SYMBOL = 23;
const int MODIFIER_SYMBOL = 24;
const int OTHER_SYMBOL = 25;

// Catégories de formatage
const int COMBINING_SPACING_MARK = 7;


// Fonction utilitaire pour obtenir la catégorie d'un point de code
int unicodeCategoryForCodePoint(int codePoint) {
  if (codePoint >= 0x0041 && codePoint <= 0x005A) return UPPERCASE_LETTER;
  if (codePoint >= 0x0061 && codePoint <= 0x007A) return LOWERCASE_LETTER;
  if (codePoint >= 0x0300 && codePoint <= 0x036F) return NON_SPACING_MARK;
  // Ajoutez d'autres plages selon vos besoins
  return OTHER_LETTER;
}
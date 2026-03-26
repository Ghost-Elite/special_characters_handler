// lib/src/constants/unicode_categories.dart
// Catégories de lettres
const int uppercaseLetter = 1;
const int lowercaseLetter = 2;
const int titlecaseLetter = 3;
const int modifierLetter = 4;
const int otherLetter = 5;

// Catégories de marques
const int nonSpacingMark = 6;
const int spacingMark = 7;
const int enclosingMark = 8;

// Catégories de nombres
const int decimalDigitNumber = 9;
const int letterNumber = 10;
const int otherNumber = 11;

// Catégories de séparateurs
const int spaceSeparator = 12;
const int lineSeparator = 13;
const int paragraphSeparator = 14;

// Catégories de ponctuation
const int dashPunctuation = 15;
const int startPunctuation = 16;
const int endPunctuation = 17;
const int connectorPunctuation = 18;
const int otherPunctuation = 19;
const int initialPunctuation = 20;
const int finalPunctuation = 21;

// Catégories de symboles
const int mathSymbol = 22;
const int currencySymbol = 23;
const int modifierSymbol = 24;
const int otherSymbol = 25;

// Catégories de formatage
const int combiningSpacingMark = 7;


// Fonction utilitaire pour obtenir la catégorie d'un point de code
int unicodeCategoryForCodePoint(int codePoint) {
  if (codePoint >= 0x0041 && codePoint <= 0x005A) return uppercaseLetter;
  if (codePoint >= 0x0061 && codePoint <= 0x007A) return lowercaseLetter;
  if (codePoint >= 0x0300 && codePoint <= 0x036F) return nonSpacingMark;
  // Ajoutez d'autres plages selon vos besoins
  return otherLetter;
}
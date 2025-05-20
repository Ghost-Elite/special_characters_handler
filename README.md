# Special Characters Handler

[![pub package](https://img.shields.io/pub/v/special_characters_handler.svg)](https://pub.dev/packages/special_characters_handler)
[![Build Status](https://github.com/yourusername/special_characters_handler/workflows/Dart/badge.svg)](https://github.com/yourusername/special_characters_handler/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Un framework Dart puissant et flexible pour gérer les caractères spéciaux, les emojis, et les entités HTML dans vos chaînes de caractères.

## Caractéristiques

- 🧹 Nettoyage intelligent des caractères spéciaux
- 🔄 Conversion des entités HTML
- 😊 Gestion des emojis
- 🔠 Normalisation Unicode
- ⚡ Performance optimisée avec cache
- 🎯 API simple et intuitive
- 🔧 Hautement configurable

## Installation

```yaml
dependencies:
  special_characters_handler: ^1.0.0
```

## Utilisation rapide

```dart
import 'package:special_characters_handler/special_characters_handler.dart';

void main() {
  // Utilisation simple avec l'extension String
  String text = "Héllô &quot;world&quot; 😊";
  String cleaned = text.cleanSpecialCharacters();
  print(cleaned); // Output: Hello "world"
  
  // Utilisation avec options personnalisées
  final options = CleaningOptions(
    removeHtmlEntities: true,
    removeEmojis: true,
    normalizeUnicode: true,
    convertAccents: true,
  );
  
  String customCleaned = text.cleanSpecialCharacters(options: options);
}
```

## Fonctionnalités détaillées

### 1. Configuration personnalisée

#dart
final handler = SpecialCharactersHandler();

// Ajout de règles personnalisées
handler.addReplacementRule(ReplacementRule(
  pattern: r'[0-9]+',
  replacement: '#',
  isRegex: true,
));

// Utilisation avec options spécifiques
final options = CleaningOptions(
  removeHtmlEntities: true,
  removeEmojis: false,
  normalizeUnicode: true,
  convertAccents: true,
  removeSpecialChars: true,
  preserveNewlines: true,
);
```

### 2. Gestion des emojis

```dart
String text = "Hello 😊 World 🌍";

// Extraction des emojis
List<String> emojis = text.extractEmojis();

// Suppression des emojis
String noEmojis = text.cleanSpecialCharacters(
  options: CleaningOptions(removeEmojis: true)
);
```

### 3. Entités HTML

```dart
String html = "&quot;Hello&quot; &amp; &apos;World&apos;";
String cleaned = html.cleanSpecialCharacters();
print(cleaned); // "Hello" & 'World'
```

### 4. Performance

Le framework utilise un système de cache intelligent pour optimiser les performances :


final handler = SpecialCharactersHandler();

// Les appels répétés sont mis en cache
String result1 = handler.clean(longText);
String result2 = handler.clean(longText); // Utilise le cache

// Statistiques de performance
Map<String, dynamic> stats = handler.getStats();
print(stats['cacheSize']);


## Documentation API complète

Pour une documentation détaillée de l'API, visitez [la documentation en ligne](https://pub.dev/documentation/special_characters_handler/latest/).

## Configuration avancée

### Configuration globale

```dart
// Dans votre fichier de configuration
const config = SpecialCharactersConfig(
  maxInputLength: 1000000,
  enableLogging: true,
  cacheSize: 1000,
);
```

### Règles personnalisées

dart
final handler = SpecialCharactersHandler();

// Ajout d'une règle simple
handler.addReplacementRule(ReplacementRule(
  pattern: '@',
  replacement: 'at',
));

// Ajout d'une règle avec expression régulière
handler.addReplacementRule(ReplacementRule(
  pattern: r'\b\d+\b',
  replacement: '#',
  isRegex: true,
));


## Contribution

Les contributions sont les bienvenues ! Voici comment vous pouvez contribuer :

1. Fork le projet
2. Créez votre branche de fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## Tests

```bash
dart test
```

## Licence

Distribué sous la licence MIT. Voir `LICENSE` pour plus d'informations.

## Auteur

yayatamba2015@gmail.com

## Remerciements

* Aux contributeurs du projet
* À la communauté Dart/Flutter

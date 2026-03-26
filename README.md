# Special Characters Handler

[![pub package](https://img.shields.io/pub/v/special_characters_handler.svg)](https://pub.dev/packages/special_characters_handler)
[![Build Status](https://github.com/yourusername/special_characters_handler/workflows/Dart/badge.svg)](https://github.com/yourusername/special_characters_handler/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Un framework Dart puissant et flexible pour gérer les caractères spéciaux, les emojis, et les entités HTML dans vos chaînes de caractères. Conçu pour la performance et la simplicité.

---

## 📑 Table des Matières

1. [Caractéristiques](#caractéristiques)
2. [Installation](#installation)
3. [Utilisation rapide](#utilisation-rapide)
4. [Fonctionnalités détaillées](#fonctionnalités-détaillées)
   - [Analyse complète de texte](#1-analyse-complète-de-texte)
   - [Niveaux et Types de nettoyage](#2-niveaux-et-types-de-nettoyage)
   - [Nettoyage personnalisé](#3-nettoyage-personnalisé)
   - [Gestion des emojis](#4-gestion-des-emojis)
   - [Support Markdown](#5-support-markdown)
   - [Slugs URL Friendly](#6-slugs-url-friendly)
   - [Extraction YouTube](#7-extraction-youtube)
5. [Configuration avancée](#configuration-avancée)
6. [Performance](#performance)
7. [Compatibilité](#compatibilité)
8. [Contribution](#contribution)
9. [Licence](#licence)

---

## Caractéristiques

- 🧹 **Nettoyage intelligent** : Supprime ou transforme les caractères spéciaux selon vos besoins.
- 🔄 **Entités HTML** : Décodage complet et automatique des entités HTML.
- 😊 **Emojis** : Détection, extraction et suppression ultra-précise des emojis.
- 🔗 **Slugs** : Génération de slugs URL-friendly (propres, minuscules, sans accents).
- 📝 **Markdown** : Nettoyage des balises Markdown (gras, liens, code) en préservant le texte.
- 🎥 **YouTube** : Extraction d'URLs depuis n'importe quel bloc HTML ou texte brut.
- 🔠 **Unicode** : Normalisation Unicode (NFC/NFD) et gestion avancée des accents.
- ⚡ **Performance** : Système de cache LRU intégré pour les textes volumineux.
- 🎯 **Simple** : API basée sur des extensions String pour une intégration immédiate.

---

## Installation

Ajoutez cette ligne à votre fichier `pubspec.yaml` :

```yaml
dependencies:
  special_characters_handler: ^1.0.0
```

## Utilisation rapide

```dart
import 'package:special_characters_handler/special_characters_handler.dart';

void main() {
  // Nettoyage avec options par défaut
  String text = "Héllô &quot;world&quot; 😊";
  print(text.cleanSpecialCharacters()); // Output: Hello "world"
  
  // Génération de slug instantanée
  print("Mon Super Article ! 😊".toSlug()); // Output: mon-super-article
  
  // Extraction de vidéos
  var youtubeLinks = "Regarde: https://youtu.be/dQw4w9WgXcQ".extractYouTubeUrls();
}
```

---

## Fonctionnalités détaillées

### 1. Analyse complète de texte

Idéal pour la validation de formulaires ou le filtrage de contenu.

```dart
final result = "Héllô 😊 &amp; world".analyzeText();

print(result.originalLength);
print(result.emojis);            // ['😊']
print(result.htmlEntities);      // ['&amp;']
print(result.accents);           // ['é', 'ô']
print(result.youtubeUrls);       // []
print(result.cleanedText);       // "Hello & world"
```

### 2. Niveaux et Types de nettoyage

Gagnez du temps avec les préréglages intégrés.

```dart
// Par niveau d'agressivité
text.cleanSpecialCharacters(options: CleaningLevel.light.toOptions());
text.cleanSpecialCharacters(options: CleaningLevel.medium.toOptions());
text.cleanSpecialCharacters(options: CleaningLevel.aggressive.toOptions());

// Par type de contenu
text.cleanSpecialCharacters(options: CleaningType.htmlOnly.toOptions());
text.cleanSpecialCharacters(options: CleaningType.emojisOnly.toOptions());
```

### 3. Nettoyage personnalisé

Prenez le contrôle total sur chaque aspect du traitement.

```dart
final options = CleaningOptions(
  removeHtmlEntities: true,
  removeEmojis: true,
  removeMarkdown: true,
  convertAccents: true,
  removeSpecialChars: true,
  preserveNewlines: false,
);

String custom = text.cleanSpecialCharacters(options: options);
```

### 4. Gestion des emojis

```dart
String text = "Hello 😊 World 🌍";

List<String> emojis = text.extractEmojis(); // ['😊', '🌍']
bool hasEmoji = text.hasEmojis();           // true
String noEmojis = text.removeEmojis();      // "Hello World "
```

### 5. Support Markdown

Transformez du contenu riche en texte brut proprement.

```dart
String markdown = "# Titre\n**Gras** et [Lien](https://dart.dev)";
String cleaned = markdown.cleanSpecialCharacters(
  options: CleaningOptions(removeMarkdown: true)
);
print(cleaned); // "Titre Gras et Lien"
```

### 6. Slugs URL Friendly

Générez des URLs propres automatiquement.

```dart
String title = "Comment créer un Slug en 2024 ! 😊";
print(title.toSlug()); // "comment-creer-un-slug-en-2024"
```

### 7. Extraction YouTube

Supporte tous les formats standards : watch, embed, et short links.

```dart
String content = 'Vidéo ici : <iframe src="https://www.youtube.com/embed/dQw4w9WgXcQ"></iframe>';
List<String> videos = content.extractYouTubeUrls();
```

---

## Configuration avancée

Configurez les limites globales au démarrage de votre application :

```dart
const config = SpecialCharactersConfig(
  maxInputLength: 1000000,
  enableLogging: true,
  cacheSize: 1000,
);
```

### Règles de remplacement personnalisées

```dart
final handler = SpecialCharactersHandler();

// Remplacement simple
handler.addReplacementRule(ReplacementRule(pattern: '@', replacement: 'at'));

// Expression régulière
handler.addReplacementRule(ReplacementRule(
  pattern: r'\b\d{4}\b',
  replacement: 'YEAR',
  isRegex: true,
));
```

---

## Performance

Le framework est conçu pour être **O(n)**. Il utilise un système de cache LRU (Least Recently Used) qui évite de recalculer le nettoyage pour des chaînes identiques déjà traitées, ce qui est particulièrement efficace dans les interfaces Flutter réactives.

---

## Compatibilité

Ce package est **pure-dart** et compatible avec toutes les plateformes :
- 📱 Android / iOS
- 💻 Windows / macOS / Linux
- 🌐 Web / Server-side (Shelf, Dart Frog)

---

## Contribution

Les contributions sont les bienvenues !

1. Fork le projet
2. Créez votre branche (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'feat: add amazing feature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

---

## Licence

Distribué sous la licence MIT. Voir `LICENSE` pour plus d'informations.

## Auteur

yayatamba2015@gmail.com

## Remerciements

* À la communauté Dart/Flutter pour ses retours inspirants.
* Aux mainteneurs des packages `characters`, `html_unescape` et `unicode`.

## 1.1.0

### Nouvelles Fonctionnalités
- **Extraction YouTube** : Nouvelle méthode `extractYouTubeUrls()` pour extraire les URLs (watch, embed, short link) depuis du texte ou du HTML.
- **Support des Slugs** : Ajout de la méthode `toSlug()` pour générer des URLs propres (minuscules, sans accents, sans emojis).
- **Nettoyage Markdown** : Nouvelle option `removeMarkdown` pour supprimer les balises (gras, liens, code) en préservant le texte.
- **Analyse Enrichie** : `analyzeText()` inclut désormais l'extraction automatique des URLs YouTube.
- **Option de Nettoyage HTML** : Ajout de `stripHtmlTags` dans `CleaningOptions` pour contrôler la suppression des balises après le décodage des entités.

### Améliorations
- **Slugs URL-friendly** : Les underscores (`_`) sont désormais convertis en tirets dans `toSlug()`.
- **Refactorisation des Extensions** : Consolidation de toutes les méthodes d'extension `String` dans un fichier unique pour une API plus claire.
- **Gestion des Emojis** : Détection plus exhaustive via le pattern centralisé `EmojiPatterns`.
- **Performance** : Système de cache LRU optimisé pour le traitement de gros volumes de texte.
- **Documentation** : Refonte complète du README avec une table des matières, des exemples interactifs et des informations de compatibilité.

### Corrections
- Correction des bugs de backreferences dans les expressions régulières Dart.
- Correction d'une régression potentielle dans le nettoyage des entités HTML.

## 1.0.0

- Version initiale.

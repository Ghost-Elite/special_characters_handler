// lib/src/constants/html_entities.dart

class HtmlEntities {
  /// Entités HTML communes
  static const Map<String, String> common = {
    // Guillemets et apostrophes
    '&quot;': '"',      // Guillemet double
    '&#39;': "'",       // Apostrophe
    '&apos;': "'",      // Apostrophe (XML)
    '&lsquo;': ''',     // Guillemet simple gauche
    '&rsquo;': ''',     // Guillemet simple droit
    '&ldquo;': '"',     // Guillemet double gauche
    '&rdquo;': '"',     // Guillemet double droit
    '&sbquo;': '‚',     // Guillemet simple bas
    '&bdquo;': '„',     // Guillemet double bas

    // Symboles HTML basiques
    '&amp;': "&",       // Esperluette
    '&lt;': '<',        // Inférieur à
    '&gt;': '>',        // Supérieur à
    '&nbsp;': ' ',      // Espace insécable
    '&ensp;': ' ',      // Espace en
    '&emsp;': ' ',      // Espace em
    '&thinsp;': ' ',    // Espace fine

    // Symboles de copyright et marques déposées
    '&copy;': '©',      // Copyright
    '&reg;': '®',       // Marque déposée
    '&trade;': '™',     // Marque de commerce

    // Signes mathématiques
    '&plusmn;': '±',    // Plus ou moins
    '&times;': '×',     // Multiplication
    '&divide;': '÷',    // Division
    '&minus;': '−',     // Moins
    '&radic;': '√',     // Racine carrée
    '&infin;': '∞',     // Infini
    '&ne;': '≠',        // Différent
    '&le;': '≤',        // Inférieur ou égal
    '&ge;': '≥',        // Supérieur ou égal
    '&asymp;': '≈',     // Approximativement égal

    // Flèches
    '&larr;': '←',      // Flèche gauche
    '&uarr;': '↑',      // Flèche haut
    '&rarr;': '→',      // Flèche droite
    '&darr;': '↓',      // Flèche bas
    '&harr;': '↔',      // Flèche double horizontale
    '&varr;': '↕',      // Flèche double verticale

    // Symboles divers
    '&bull;': '•',      // Puce
    '&middot;': '·',    // Point médian
    '&hellip;': '…',    // Points de suspension
    '&prime;': '′',     // Prime
    '&Prime;': '″',     // Double prime
    '&sect;': '§',      // Section
    '&para;': '¶',      // Paragraphe
    '&deg;': '°',       // Degré
  };

  /// Entités HTML étendues (monétaires, mathématiques, etc.)
  static const Map<String, String> extended = {
    // Symboles monétaires
    '&euro;': '€',      // Euro
    '&pound;': '£',     // Livre sterling
    '&cent;': '¢',      // Cent
    '&yen;': '¥',       // Yen
    '&curren;': '¤',    // Symbole monétaire générique
    '&fnof;': 'ƒ',      // Florin

    // Lettres grecques
    '&alpha;': 'α',     // Alpha
    '&beta;': 'β',      // Beta
    '&gamma;': 'γ',     // Gamma
    '&delta;': 'δ',     // Delta
    '&epsilon;': 'ε',   // Epsilon
    '&omega;': 'ω',     // Omega
    '&pi;': 'π',        // Pi
    '&sigma;': 'σ',     // Sigma
    '&theta;': 'θ',     // Theta

    // Symboles mathématiques supplémentaires
    '&sum;': '∑',       // Somme
    '&prod;': '∏',      // Produit
    '&int;': '∫',       // Intégrale
    '&part;': '∂',      // Dérivée partielle
    '&nabla;': '∇',     // Nabla
    '&isin;': '∈',      // Appartient à
    '&notin;': '∉',     // N'appartient pas à
    '&cap;': '∩',       // Intersection
    '&cup;': '∪',       // Union
    '&empty;': '∅',     // Ensemble vide
    '&equiv;': '≡',     // Équivalent
    '&there4;': '∴',    // Par conséquent

    // Exposants et indices
    '&sup1;': '¹',      // Exposant un
    '&sup2;': '²',      // Exposant deux
    '&sup3;': '³',      // Exposant trois
    '&frac14;': '¼',    // Un quart
    '&frac12;': '½',    // Un demi
    '&frac34;': '¾',    // Trois quarts

    // Symboles techniques
    '&permil;': '‰',    // Pour mille
    '&micro;': 'µ',     // Micro
    '&perp;': '⊥',      // Perpendiculaire
    '&ang;': '∠',       // Angle
    '&cong;': '≅',      // Congruent à
    '&oplus;': '⊕',     // Plus encerclé
    '&otimes;': '⊗',    // Multiplication encerclée

    // Symboles spéciaux
    '&dagger;': '†',    // Obèle
    '&Dagger;': '‡',    // Double obèle
    '&loz;': '◊',       // Losange
    '&spades;': '♠',    // Pique
    '&clubs;': '♣',     // Trèfle
    '&hearts;': '♥',    // Cœur
    '&diams;': '♦',     // Carreau
  };

  /// Combine toutes les entités en une seule Map
  static Map<String, String> get all => {
    ...common,
    ...extended,
  };
}
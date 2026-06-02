# RATZ ODYSSEY

Un jeu RPG 2D en pixel-art réalisé avec Godot 4.5

## 📖 Description

Rez, un rat solitaire, part à la recherche du Saint Fromage, une légende capable d'exaucer un vœu. Au cours de son voyage à travers différents mondes, il rencontrera des PNJ avec lesquels il devra établir des relations pour progresser.

## 🎮 Modes de Jeu

- **Solo** : Un joueur au clavier
- **Multijoueur Local** : Deux joueurs (clavier + manette)

## 📋 Contrôles

| Action | Clavier | Manette |
|--------|---------|---------|
| Haut | W / ↑ | Stick ↑ |
| Bas | S / ↓ | Stick ↓ |
| Gauche | A / ← | Stick ← |
| Droite | D / → | Stick → |
| Valider | E / Enter | A |
| Menu | Échap | Start |

## 📁 Structure du Projet

```
Ratz-odyssey/
├── scenes/           # Scènes Godot (.tscn)
│   ├── main_menu.tscn
│   ├── main.tscn
│   ├── player.tscn
│   ├── npc.tscn
│   └── dialogue_ui.tscn
├── scripts/          # Scripts GDScript
│   ├── game_manager.gd       # Gestionnaire global (singleton)
│   ├── main_menu.gd          # Menu principal
│   ├── main.gd               # Gestion de la scène principale
│   ├── player.gd             # Système de mouvement
│   ├── npc.gd                # Système PNJ et dialogues
│   ├── dialogue_system.gd    # Système de dialogues arborescent
│   └── dialogue_ui.gd        # Interface de dialogue
└── assets/           # Ressources
    ├── sprites/      # Sprites et animations
    ├── sounds/       # Musique et effets sonores
    └── maps/         # Tilesets et cartes
```

## 🔧 Configuration

### Prérequis
- Godot 4.5 ou supérieur

### Installation

1. Cloner le dépôt :
```bash
git clone https://github.com/user/Ratz-odyssey.git
cd Ratz-odyssey
```

2. Ouvrir le projet dans Godot 4.5
   - Lancer Godot
   - Cliquer sur "Ouvrir" ou "Open"
   - Sélectionner le dossier du projet

3. Appuyer sur F5 ou cliquer sur "Exécuter" pour lancer le jeu

## 🎯 Phases de Développement

### Phase 1 (COMPLÉTÉE) ✓
- [x] Menu principal (solo/multi)
- [x] Système de mouvement (2 joueurs)
- [x] Caméra suivante
- [x] Structure de base du projet

### Phase 2 (EN COURS)
- [ ] Système de dialogue amélioré
- [ ] Implémentation des 6 PNJ
- [ ] Système de relation PNJ
- [ ] Animations (marche/idle)

### Phase 3
- [ ] Système de combat/esquive
- [ ] Objets collectibles
- [ ] Cinématiques finales

### Phase 4
- [ ] Son et musique
- [ ] Polish visuel
- [ ] QA et bug fixes
- [ ] Équilibrage

## 🎨 Personnages

### Joueur
- **Rez** (Rat) - Malin, naïf, curieux

### PNJ Alliés Potentiels
- **Griska** (Taupe) - Marchande/Guide
- **Pip** (Souris) - Voleur repenti
- **Torve** (Rat) - Garde déserteur

### PNJ Ennemis Potentiels
- **Le Duc** (Rat) - Noble avide
- **Skarl** (Serpent) - Mercenaire
- **Triplettes** (Souris) - Espionnes

### Antagoniste
- **Moka** (Rat) - Ancien ami

## 📊 Système de Relation

Chaque PNJ a un score de relation (0-100) :
- **0-30** : Ennemi (attaque/bloque)
- **30-70** : Neutre (accepte quête)
- **70-100** : Allié (aide en combat/puzzle)

## 🏁 Fins du Jeu

| Fin | Objet | Résultat |
|-----|-------|----------|
| **Facile** | Fromage | Rez rentre vivant - FIN CLASSIQUE |
| **Difficile** | Télescope | Moka tue Rez - VRAIE FIN |

## 📝 Notes de Développement

- Le système de dialogue est arborescent avec conditions
- Les relations PNJ influencent la progression
- Mode multijoueur avec caméra partagée
- Collaboration bonus : +20% score si aidé ensemble

## 🐛 Signaler des Bugs

Créer une issue dans le dépôt GitHub avec :
- Description du bug
- Étapes pour reproduire
- Capture d'écran si applicable
- OS et version Godot utilisée

## 📄 Licence

Ce projet est réalisé selon les spécifications du cahier des charges.

## 👥 Contributeurs

- Game Design & Development

---

**Version 1.0** - Juin 2025

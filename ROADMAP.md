# Roadmap de Développement - Ratz Odyssey

## Phase 1: Fondations ✓ COMPLÉTÉE

### Menu et Navigation
- [x] Menu principal (Solo/Multi/Quitter)
- [x] Navigation entre scènes
- [x] Sélection mode jeu

### Système de Joueur
- [x] Mouvement basique (WASD + Flèches)
- [x] Support manette (analogique)
- [x] Deux joueurs simultanés
- [x] Système de collision basique

### Caméra
- [x] Suivi du joueur en solo
- [x] Suivi partagé en multijoueur
- [x] Smooth camera follow

### Infrastructure
- [x] Structure du projet Godot 4.5
- [x] GameManager (singleton)
- [x] Système de gestion d'état
- [x] Configuration des contrôles

**Statut**: ✅ Prêt pour Phase 2

---

## Phase 2: Dialogues et PNJ (EN COURS)

### Système de Dialogue
- [x] Dialogue arborescent basique
- [x] Arbre de dialogue par PNJ
- [x] Système de choix
- [ ] Conditions sur les choix
- [ ] Actions post-dialogue
- [ ] Dialogue context-aware

### PNJ de Base
- [ ] Griska (Taupe - Marchande)
  - [ ] Sprites idle/dialogue
  - [ ] Dialogue 5-6 nœuds
  - [ ] Mécanique d'achat

- [ ] Pip (Souris - Voleur)
  - [ ] Sprites idle/dialogue
  - [ ] Dialogue de quête
  - [ ] Mécanique de vol

- [ ] Torve (Rat - Garde)
  - [ ] Sprites idle/dialogue
  - [ ] Dialogue coopération
  - [ ] Aide au combat

- [ ] Le Duc (Rat - Noble)
  - [ ] Sprites idle/dialogue
  - [ ] Dialogue d'allégeance
  - [ ] Obstacle au château

- [ ] Skarl (Serpent - Mercenaire)
  - [ ] Sprites idle/dialogue
  - [ ] Dialogue confrontation
  - [ ] Combat possible

- [ ] Triplettes (Souris - Espionnes)
  - [ ] Sprites idle/dialogue
  - [ ] Dialogue équipe
  - [ ] Information trading

### Système de Relation
- [x] Stockage des relations (0-100)
- [x] Calcul du statut (ennemi/neutre/allié)
- [ ] Affichage du score
- [ ] Modification dynamique
- [ ] Conditions basées sur le score

### Interface de Dialogue
- [x] Boîte de dialogue basique
- [x] Affichage du nom du PNJ
- [x] Boutons de choix
- [ ] Animation d'apparition
- [ ] Scroll du texte
- [ ] Effects visuels

**Estimé**: 2-3 semaines

---

## Phase 3: Gameplay et Progression

### Système de Combats
- [ ] Combat simple (barre d'énergie)
- [ ] Attaque/défense basique
- [ ] Esquive possible
- [ ] Cibles IA
- [ ] Système de rewards

### Objets et Inventaire
- [ ] Collecte d'objets
- [ ] Inventaire UI
- [ ] Utilisation d'objets
- [ ] Clés (accès zones)
- [ ] Objets clés (fromage, télescope)

### Progression de l'Histoire
- [ ] Acte 1 - La Route
  - [ ] Terrier (départ)
  - [ ] Forêt
  - [ ] Rencontres PNJ

- [ ] Acte 2 - Tour du Fromage
  - [ ] Chateau du Duc
  - [ ] Caverne finale
  - [ ] Puzzles

- [ ] Acte 3 - Le Choix Final
  - [ ] Révélation de Moka
  - [ ] Choix fromage/télescope
  - [ ] Cinématiques finales

### Mapping et Design
- [ ] Tileset forêt
- [ ] Tileset château
- [ ] Tileset caverne
- [ ] Tileset terrier
- [ ] Parallax backgrounds
- [ ] Obstacles et collisions

**Estimé**: 4-5 semaines

---

## Phase 4: Polish et Finalisation

### Audio
- [ ] Musique ambiance (boucle 2 min)
- [ ] SFX pas/dialogue
- [ ] SFX combat/coup
- [ ] SFX mort/victoire
- [ ] Jingles

### Animations
- [ ] Rez walk/idle
- [ ] Rez attack/hurt
- [ ] PNJ animations
- [ ] Moka reveal animation
- [ ] Transition cinématiques

### UI et Effects
- [ ] Main menu polish
- [ ] HUD in-game
- [ ] Score relation affichage (optionnel)
- [ ] Effet dialogue
- [ ] Feedback visuel combats

### Optimisation
- [ ] Performance (60+ FPS)
- [ ] Gestion mémoire
- [ ] Loading times
- [ ] Caching ressources

### QA et Bug Fixing
- [ ] Test solo
- [ ] Test multijoueur
- [ ] Test clavier/manette
- [ ] Test dialogues
- [ ] Test combats
- [ ] Test fins

**Estimé**: 2-3 semaines

---

## Timeline Global

| Phase | Durée | Fin Estimée |
|-------|-------|------------|
| Phase 1 | 1-2 sem | ✅ Fait |
| Phase 2 | 2-3 sem | ~25 Juin |
| Phase 3 | 4-5 sem | ~30 Juillet |
| Phase 4 | 2-3 sem | ~20 Août |
| **Total** | **~12-14 semaines** | **~20 Août** |

---

## Priorités par Phase

### Phase 2 (Critique)
1. Tous les dialogues des PNJ
2. Système de relation complet
3. Interface de dialogue polie
4. Conditions et actions

### Phase 3 (Essentiel)
1. Acte 1 et 2 du story
2. Système de combat simple
3. Objets clés (fromage/télescope)
4. Révélation de Moka

### Phase 4 (Polish)
1. Animations
2. Audio
3. Cinématiques
4. Tests exhaustifs

---

## Features Optionnelles (Nice-to-Have)

- [ ] Quêtes secondaires
- [ ] Mini-map
- [ ] Journal du joueur
- [ ] Achievements
- [ ] New Game+
- [ ] Différents niveaux de difficulté
- [ ] Mode speedrun
- [ ] Dialogues supplémentaires

---

## Notes Techniques

### Godot Features Utilisées
- CharacterBody2D pour le mouvement
- Area2D pour les interactions
- DialogueSystem personnalisé
- Signaux pour événements
- Autoloads pour GameManager
- AnimatedSprite2D pour animations

### Assets Requis
- ~40-50 sprites (personnages)
- ~100 tiles (tilesets)
- 4-5 musiques
- 10+ SFX
- 2 polices (titre + dialogue)

### Architecture
```
Hierarchie:
- GameManager (Autoload)
- MainScene
  - Players (CharacterBody2D)
  - NPCs (Area2D)
  - TileMap
  - Camera2D
  - DialogueUI
```

---

## Points de Validation

- [ ] Phase 1: Mouvement fluide, menu fonctionnel
- [ ] Phase 2: Dialogues fluides, relations changeantes
- [ ] Phase 3: Story cohérente, objectifs clairs
- [ ] Phase 4: Polish complet, QA réussi

---

**Mise à jour**: 2 Juin 2025  
**Responsable**: Game Development Team  
**Version**: 1.0

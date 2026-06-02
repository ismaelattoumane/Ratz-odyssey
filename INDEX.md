# 📚 Index Complet du Projet

## 🎮 Démarrer Ici

**Nouveau au projet?** Lisez dans cet ordre:

1. **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** ⭐ (5 min) - Vue générale du jeu
2. **[QUICKSTART.md](QUICKSTART.md)** (5 min) - Comment lancer
3. **[README.md](README.md)** (10 min) - Documentation générale

## 📖 Documentation

### Vue d'Ensemble
- **[README.md](README.md)** - Description générale, contrôles, structure
- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - Résumé exécutif et KPIs

### Guides Pratiques
- **[QUICKSTART.md](QUICKSTART.md)** - Installation et lancement rapide
- **[LAUNCH_CHECKLIST.md](LAUNCH_CHECKLIST.md)** - Checklist avant lancement
- **[TESTING.md](TESTING.md)** - Guide complet de test

### Développement
- **[DEVELOPMENT.md](DEVELOPMENT.md)** - Guide pour les développeurs
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Structure technique détaillée
- **[ROADMAP.md](ROADMAP.md)** - Plan de développement Phase 2-4

## 🎬 Scènes Godot

```
scenes/
├── main_menu.tscn          Menu principal (Solo/Multi/Quitter)
├── main.tscn               Scène de jeu principale
├── player.tscn             Template joueur (CharacterBody2D)
└── npc.tscn                Template NPC (Area2D)
```

### Références de Scènes
- `main_menu.tscn` → Lance quand le jeu démarre
- `main.tscn` → Lance après sélection mode
- `player.tscn` → Instancié par main.gd
- `npc.tscn` → Instancié par main.gd (6 instances)

## 🎮 Scripts GDScript

```
scripts/
├── game_manager.gd         État global (Autoload/Singleton)
├── main_menu.gd            Contrôleur menu
├── main.gd                 Contrôleur scène principale
├── player.gd               Joueur (mouvement)
├── npc.gd                  PNJ (dialogue)
├── dialogue_system.gd      Moteur dialogue
└── dialogue_ui.gd          Interface dialogue
```

### Dépendances de Scripts
```
player.gd
└── utilise: Input, CharacterBody2D, AnimatedSprite2D

npc.gd
├── utilise: Area2D, DialogueSystem
├── appelle: GameManager.modify_npc_relation()
└── appelle: DialogueUI.show_dialogue()

main.gd
├── instancie: Player, NPC (×6)
├── utilise: GameManager, DialogueSystem
└── gère: Camera2D

main_menu.gd
├── appelle: GameManager.set_game_mode()
└── change scène vers: main.tscn

dialogue_system.gd
└── données statiques (pas de dépendances)

dialogue_ui.gd
└── appelle: NPC.process_choice(), NPC.end_dialogue()

game_manager.gd
└── pas de dépendances (singleton indépendant)
```

## 🎨 Assets

```
assets/
├── sprites/
│   └── player_sprites.tres     SpriteFrames (vide - à remplir)
├── sounds/
│   ├── music/                  (À créer)
│   └── sfx/                    (À créer)
└── maps/
    └── tileset.tres            TileSet (vide - à remplir)
```

## 📊 Configuration du Projet

- **project.godot** - Configuration Godot
  - Nom: "Ratz Odyssey"
  - Version: 1.0.0
  - Fenêtre: 1280×720
  - Scène principale: res://scenes/main_menu.tscn
  - Autoload: GameManager → res://scripts/game_manager.gd

## 🔗 Flux d'Exécution

```
1. Godot lance project.godot
2. Charge autoload: GameManager
3. Charge main_menu.tscn
4. Menu affiche: [Solo] [Multijoueur] [Quitter]
5. Joueur clique [Solo]
6. GameManager.set_game_mode("solo")
7. Charge main.tscn
8. main.gd crée 1 joueur + 6 PNJ + camera
9. Joueur peut:
   - Se déplacer (WASD)
   - Interagir avec PNJ (E)
   - Retourner au menu (Échap)
```

## 🎯 Qu'Ajouter Ensuite

### Pour Phase 2 (Dialogues & Animation)
- [ ] Créer sprites Rez (4 directions)
- [ ] Créer sprites 6 PNJ
- [ ] Ajouter animations aux SpriteFrames
- [ ] Complétiser les arbres de dialogue
- [ ] Tester tous les chemins de dialogue

### Pour Phase 3 (Gameplay)
- [ ] Créer maps (forêt, château, caverne)
- [ ] Implémenter système de combat
- [ ] Ajouter objets collectibles
- [ ] Programmer les deux fins

### Pour Phase 4 (Polish)
- [ ] Ajouter musique et SFX
- [ ] Créer cinématiques
- [ ] Polisher UI
- [ ] Tests et optimisation

## 📝 Comment Utiliser Ces Fichiers

### Pour Lancer le Jeu
→ Voir **[QUICKSTART.md](QUICKSTART.md)**

### Pour Comprendre l'Architecture
→ Voir **[ARCHITECTURE.md](ARCHITECTURE.md)**

### Pour Ajouter un PNJ
→ Voir **[DEVELOPMENT.md](DEVELOPMENT.md)** section "Ajouter un Nouveau PNJ"

### Pour Tester
→ Voir **[TESTING.md](TESTING.md)**

### Pour Voir le Plan Complet
→ Voir **[ROADMAP.md](ROADMAP.md)**

## 🔍 Recherche Rapide

| Besoin | Fichier |
|--------|---------|
| Ajouter PNJ | DEVELOPMENT.md |
| Ajouter dialogue | dialogue_system.gd |
| Modifier mouvement | player.gd |
| Modifier menu | main_menu.gd |
| Comprendre structure | ARCHITECTURE.md |
| Tester jeu | TESTING.md |
| Voir plan | ROADMAP.md |
| Configurer Godot | project.godot |
| État global | game_manager.gd |

## 📊 Statistiques

- **Scripts**: 7 fichiers GDScript
- **Scènes**: 4 fichiers .tscn
- **Documentation**: 8 fichiers Markdown
- **Configuration**: project.godot + .gitignore
- **Assets**: 3 dossiers (vides à remplir)

**Total**: 25+ fichiers

## 🎊 Checklist Rapide

- [x] Godot 4.5 configuration
- [x] Scripts de base
- [x] Scènes de base
- [x] Documentation complète
- [ ] Sprites et animations (Phase 2)
- [ ] Maps et obstacles (Phase 3)
- [ ] Audio et cinématiques (Phase 4)

## 📞 Support

**Erreur lors du lancement?**
→ Voir [TESTING.md - Troubleshooting](TESTING.md#troubleshooting-rapide)

**Erreur lors du développement?**
→ Voir [DEVELOPMENT.md](DEVELOPMENT.md)

**Questions de structure?**
→ Voir [ARCHITECTURE.md](ARCHITECTURE.md)

## 🔄 Workflow Recommandé

```
1. Lancer le jeu (QUICKSTART.md)
2. Tester menu et mouvement (TESTING.md)
3. Créer sprites (non documenté - besoin graphiste)
4. Développer Phase 2 (DEVELOPMENT.md)
5. Construire maps (non documenté - besoin designer)
6. Implémenter combats (à documenter)
7. Ajouter audio (à documenter)
8. Polish final (ROADMAP.md Phase 4)
```

## 🎯 Prochains Documents à Créer

Ces documents devraient être créés quand le travail commence:

- [ ] SPRITES.md - Guide création sprites
- [ ] MAPS.md - Guide création cartes
- [ ] AUDIO.md - Guide intégration son
- [ ] COMBAT.md - Système de combat détaillé
- [ ] CINEMATIC.md - Système cinématiques
- [ ] BALANCE.md - Données d'équilibrage
- [ ] CHANGELOG.md - Historique des versions

---

## 🎮 Navigation Rapide

**Je veux...**

| Faire | Fichier |
|------|---------|
| Lancer le jeu | QUICKSTART.md |
| Comprendre le code | ARCHITECTURE.md |
| Développer | DEVELOPMENT.md |
| Tester | TESTING.md |
| Voir le plan | ROADMAP.md |
| Lire la story | CAHIER_DES_CHARGES.md |
| Connaître l'état | PROJECT_SUMMARY.md |

---

**Dernière mise à jour**: 2 Juin 2025  
**Version**: 1.0.0-alpha  
**État**: Phase 1 ✅ Complétée, Phase 2 📋 Planifiée

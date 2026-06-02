# 🎮 RATZ ODYSSEY - Résumé Exécutif

## Vue Rapide

| Aspect | Détail |
|--------|--------|
| **Genre** | RPG 2D / 2.5D Pixel-Art |
| **Engine** | Godot 4.5 |
| **Plateforme** | PC (Linux/Windows/Mac) |
| **Joueurs** | 1-2 (local coop) |
| **Statut** | Phase 1 ✅ Complétée |
| **Durée** | ~30-45 min par partie |
| **Version** | 1.0.0 (pré-alpha) |

## 📖 Histoire

Rez, un rat curieux, cherche le **Saint Fromage** - une légende capable d'exaucer un vœu. En chemin, il rencontre 6 PNJ qui deviennent alliés, neutres ou ennemis selon ses choix. 

**Deux fins possibles:**
- **Fin Facile** 🧀: Prendre le Fromage → Rez rentre vivant
- **Fin Vraie** 🔭: Prendre le Télescope → Moka tue Rez

## 🎯 État du Projet

### ✅ Complété (Phase 1)
- Menu principal (Solo/Multi/Quitter)
- Système de mouvement (clavier + manette)
- Caméra suivante intelligente
- Structure dialogue arborescente
- Système de relations PNJ
- Deux joueurs simultanés
- GameManager singleton

### ⏳ En Cours / Planifié
- Sprites et animations réalistes
- Maps complètes (forêt, château, caverne)
- Système de combat
- Audio (musique et SFX)
- Cinématiques finales
- Polish et optimisation

## 🏗️ Architecture

```
Godot 4.5
├── GameManager (Singleton global)
├── MainScene (Jeu principal)
│   ├── Player (mouvement)
│   ├── NPCs (dialogues)
│   ├── Camera (suivi)
│   └── DialogueUI (interface)
└── MainMenu (Sélection mode)
```

## 📊 Données PNJ

| Nom | Race | Rôle | Relation Start |
|-----|------|------|-----------------|
| Griska | Taupe | Marchande | 50 |
| Pip | Souris | Voleur | 50 |
| Torve | Rat | Garde | 50 |
| Duc | Rat | Noble | 50 |
| Skarl | Serpent | Mercenaire | 50 |
| Triplettes | Souris | Espionnes | 50 |
| Moka | Rat | Antagoniste | 100 |

## 🎮 Contrôles

**Joueur 1 (Clavier)**
```
W/↑ = Haut
S/↓ = Bas
A/← = Gauche
D/→ = Droite
E = Interagir
Échap = Menu
```

**Joueur 2 (Manette)**
```
Stick = Mouvement
Button A = Interagir
Start = Menu
```

## 📁 Structure des Fichiers

```
Ratz-odyssey/
├── 📄 Documentation (6 fichiers)
│   ├── README.md ..................... Vue d'ensemble
│   ├── QUICKSTART.md ................ Démarrage rapide
│   ├── DEVELOPMENT.md ............... Guide dev
│   ├── TESTING.md ................... Tests
│   ├── ARCHITECTURE.md .............. Structure tech
│   ├── ROADMAP.md ................... Timeline
│   └── LAUNCH_CHECKLIST.md .......... Checklist
│
├── 🎮 Scripts GDScript (7 fichiers)
│   ├── game_manager.gd .............. État global
│   ├── main_menu.gd ................. Menu
│   ├── main.gd ...................... Jeu principal
│   ├── player.gd .................... Joueur
│   ├── npc.gd ....................... PNJ
│   ├── dialogue_system.gd ........... Dialogues
│   └── dialogue_ui.gd ............... UI dialogue
│
├── 🎬 Scènes Godot (4 fichiers)
│   ├── main_menu.tscn ............... Menu UI
│   ├── main.tscn .................... Scène jeu
│   ├── player.tscn .................. Template joueur
│   └── npc.tscn ..................... Template PNJ
│
└── 🎨 Assets (structure)
    ├── sprites/ ..................... (à remplir)
    ├── sounds/ ....................... (à remplir)
    └── maps/ ......................... (à remplir)
```

## 🚀 Lancer le Jeu

### Prérequis
- Godot 4.5+ installé
- ~500 MB d'espace disque

### Lancement
1. Ouvrir Godot 4.5
2. Importer le dossier `/home/ismadvl/club/Ratz-odyssey`
3. Appuyer sur **F5** ou cliquer Run
4. Menu principal apparaît

## 📈 Timeline Estimée

| Phase | Durée | État |
|-------|-------|------|
| 1 - Setup | 1-2 sem | ✅ DONE |
| 2 - Dialogues | 2-3 sem | 📋 PLANNING |
| 3 - Gameplay | 4-5 sem | 📋 PLANNING |
| 4 - Polish | 2-3 sem | 📋 PLANNING |
| **Total** | **9-13 sem** | **v1.0 August 2025** |

## 🐛 Limitations Actuelles

1. **Pas de Sprites Réels**
   - Système en place mais images manquantes
   - Placeholders textuels fonctionnels

2. **Dialogues Basiques**
   - Structure complète mais limitée
   - Conditions/actions partielles

3. **Pas de Maps**
   - TileMap créé mais vide
   - Collision prête pour implémentation

4. **Pas d'Audio**
   - Structure prête
   - Fichiers à ajouter en Phase 4

## ✨ Points Forts

- ✅ **Architecture Claire** - Code organisé et extensible
- ✅ **Système Dialogue Flexible** - Facile d'ajouter PNJ
- ✅ **2 Joueurs Support** - Codé dès le départ
- ✅ **Documentation Complète** - 6 guides détaillés
- ✅ **Godot 4.5** - Moteur moderne et gratuit

## 🎯 Objectifs Phase 2

1. Créer sprites Rez (4 directions × 3 poses)
2. Créer sprites 6 PNJ
3. Ajouter animations
4. Complétiser dialogues
5. Tester tous les dialogues

## 📞 Ressources

- **Godot Docs**: https://docs.godotengine.org/en/stable/
- **GDScript Guide**: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/
- **2D Physics**: https://docs.godotengine.org/en/stable/tutorials/physics/using_2d_characters/

## 💡 Quick Tips

```gdscript
# Ajouter de l'or
GameManager.add_gold(50)

# Modifier relation PNJ
GameManager.modify_npc_relation("griska", 20)

# Vérifier statut
if GameManager.get_npc_status("griska") == "ally":
    # Bonus!

# Ajouter item
GameManager.add_inventory_item("clé_château")

# Vérifier progression
if GameManager.story_flags.get("met_moka", false):
    # Moka est apparu!
```

## 🎊 Prochaines Étapes

1. **Immédiat**: Créer les assets graphiques
2. **Semaine 1**: Implémenter les animations
3. **Semaine 2-3**: Finaliser Phase 2
4. **Juin**: Commencer Phase 3 (combats)
5. **Juillet**: Phase 3 complète
6. **Août**: Phase 4 (audio + polish)
7. **Août-Septembre**: QA finale et release v1.0

## 📊 Statistiques du Projet

- **Lignes de code**: ~800 (GDScript)
- **Scènes**: 4
- **Scripts**: 7
- **Documents**: 7
- **Dossiers**: 10
- **Fichiers totaux**: 40+

## 🏆 Spécifications du Cahier Couvertes

- ✅ Concept RPG 2D
- ✅ Godot 4.5
- ✅ 1-2 joueurs
- ✅ Menu solo/multi
- ✅ Mouvement clavier/manette
- ✅ Caméra suivante
- ✅ 6 PNJ
- ✅ Système dialogue
- ✅ Système relation
- ⏳ Combat (Phase 3)
- ⏳ Cinématiques (Phase 3)
- ⏳ Audio (Phase 4)

## 📝 Prochains Docs à Lire

1. **[QUICKSTART.md](QUICKSTART.md)** - Commence ici! (5 min)
2. **[DEVELOPMENT.md](DEVELOPMENT.md)** - Pour développer (10 min)
3. **[ARCHITECTURE.md](ARCHITECTURE.md)** - Comprendre la structure (15 min)
4. **[ROADMAP.md](ROADMAP.md)** - Voir le plan complet (5 min)

---

## 🎬 État Actuel

**Phase 1 de développement complétée avec succès!** ✅

Le jeu a une fondation solide avec:
- Système de mouvement fonctionnel
- Dialogues arborescents implémentés
- Architecture extensible
- Documentation complète

**Prêt pour Phase 2** 🚀

Voir [QUICKSTART.md](QUICKSTART.md) pour commencer ou [ROADMAP.md](ROADMAP.md) pour la vision complète.

---

**Créé avec ❤️ en Godot 4.5**  
**Version 1.0.0-alpha**  
**Juin 2025**

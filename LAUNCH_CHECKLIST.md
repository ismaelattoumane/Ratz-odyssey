# Checklist de Lancement - Ratz Odyssey

## ✅ Avant de Lancer le Jeu

### Configuration du Projet
- [x] Godot 4.5 installé
- [x] project.godot créé et configuré
- [x] Dossiers créés (scenes, scripts, assets)
- [x] Autoload GameManager défini

### Scripts GDScript (7 fichiers)
- [x] game_manager.gd - Gestionnaire global
- [x] main_menu.gd - Menu principal
- [x] main.gd - Scène principale
- [x] player.gd - Joueur (mouvement)
- [x] npc.gd - PNJ (dialogues)
- [x] dialogue_system.gd - Système de dialogues
- [x] dialogue_ui.gd - Interface dialogues

### Scènes Godot (4 fichiers)
- [x] main_menu.tscn - Menu avec boutons
- [x] main.tscn - Scène de jeu
- [x] player.tscn - Joueur avec mouvement
- [x] npc.tscn - Template NPC

### Documentation (5 fichiers)
- [x] README.md - Vue d'ensemble
- [x] QUICKSTART.md - Démarrage rapide
- [x] DEVELOPMENT.md - Guide de développement
- [x] TESTING.md - Guide de test
- [x] ROADMAP.md - Plan de développement

### Ressources (placeholders)
- [x] player_sprites.tres - SpriteFrames vide
- [x] tileset.tres - TileSet vide
- [x] icon.png - Icône projet

---

## 🎮 Première Exécution

### Étape 1: Ouvrir dans Godot
1. Lancer Godot 4.5
2. Cliquer sur "Importer" ou "Import"
3. Naviguer vers `/home/ismadvl/club/Ratz-odyssey`
4. Cliquer sur "Ouvrir" ou "Open"
5. Le projet se charge

### Étape 2: Lancer le Jeu
1. Appuyer sur **F5** ou cliquer sur le bouton ▶️ (Run)
2. Attendre le chargement (quelques secondes)
3. Le menu principal apparaît

### Étape 3: Tester le Menu
- Cliquer sur **"Solo"** → Lance le jeu en solo
- Revenir au menu avec **Échap**
- Cliquer sur **"Multijoueur"** → Deux joueurs
- Cliquer sur **"Quitter"** → Ferme le jeu

### Étape 4: Tester le Mouvement
- Utiliser **W/A/S/D** ou **Flèches** pour bouger
- Observer la caméra qui suit
- En multijoueur, les deux joueurs se déplacent

### Étape 5: Tester les Dialogues
- Approcher un point orange (PNJ)
- Appuyer sur **E** pour parler
- Cliquer sur les options de dialogue
- Le dialogue progresse selon les choix

---

## 🔧 Troubleshooting Rapide

| Problème | Solution |
|----------|----------|
| Scene not found | Vérifier les chemins dans main.gdscript |
| Pas de menu | Vérifier run/main_scene dans project.godot |
| Pas d'affichage dialogue | Vérifier DialogueUI dans la scène main |
| Mouvements lents | Vérifier la vitesse dans player.gd |
| Erreur script | Vérifier la console Godot (F12) |

---

## 📊 État du Jeu

### Implémenté ✅
- [x] Menu principal
- [x] Système de mouvement
- [x] Caméra suivante
- [x] Dialogues arborescents
- [x] Système de relation PNJ
- [x] Deux joueurs simultanés
- [x] Interaction avec PNJ

### À Implémenter ❌
- [ ] Sprites réels (placeholders en place)
- [ ] Animations
- [ ] Tilemap avec obstacles
- [ ] Système de combat
- [ ] Objets à collecter
- [ ] Fins du jeu
- [ ] Audio (musique/SFX)

### Spécifications du Cahier des Charges
- [x] Menu solo/multi ✅
- [x] Mouvement clavier + manette ✅
- [x] Caméra suivante ✅
- [x] Système dialogue basique ✅
- [x] PNJ et relations ✅
- [ ] Combats (Phase 3)
- [ ] Cinématiques (Phase 3)
- [ ] Audio (Phase 4)

---

## 📋 Prochaines Actions

### Immédiate (pour continuer)
1. Créer les sprites du joueur (4 directions × 3 frames)
2. Créer les sprites des 6 PNJ
3. Ajouter les images aux SpriteFrames

### Court terme (Phase 2)
1. Finaliser tous les dialogues
2. Tester toutes les interactions
3. Implémenter les conditions de dialogue
4. Ajouter les premiers puzzles

### Moyen terme (Phase 3)
1. Créer les maps (forêt, château, caverne)
2. Implémenter le système de combat
3. Ajouter les objets collectibles
4. Programmer les finales

### Long terme (Phase 4)
1. Ajouter le son et la musique
2. Créer les cinématiques
3. Polisher l'interface
4. Tester et déboguer complètement

---

## 🎯 KPIs de Succès

### Gameplay Basics
- [ ] 60 FPS en solo
- [ ] 30+ FPS en multijoueur
- [ ] Temps de chargement < 2s
- [ ] Aucun crash

### Contenu
- [ ] 6 PNJ avec dialogues complets
- [ ] 3 actes de l'histoire implémentés
- [ ] 2 finales différentes
- [ ] 10+ minutes de gameplay

### Polish
- [ ] Sprites animés
- [ ] Effets visuels
- [ ] Audio complet
- [ ] UI polie

---

## 📞 Support et Ressources

### En Cas de Problème
1. Consulter [TESTING.md](TESTING.md)
2. Vérifier la console Godot (F12)
3. Lire [DEVELOPMENT.md](DEVELOPMENT.md)
4. Consulter le [CAHIER_DES_CHARGES.md](../CAHIER_DES_CHARGES.md)

### Documentation Helpful Links
- [Godot Docs](https://docs.godotengine.org/en/stable/)
- [GDScript Tutorial](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
- [CharacterBody2D Docs](https://docs.godotengine.org/en/stable/tutorials/physics/using_2d_characters/index.html)

---

## ✨ Notes Spéciales

- **Phase 1 Complete**: Menu, mouvement, caméra ✅
- **Phase 2 Ready**: Dialogues et système relationnel prêts
- **Architecture Sound**: Extensible et maintenable
- **Assets Blocking**: Phase 2 nécessite les sprites
- **Timeline**: ~12-14 semaines pour version 1.0

---

**Status**: 🟢 Prêt à tester et développer
**Mise à jour**: 2 Juin 2025
**Version**: 1.0.0

# Quick Start - Ratz Odyssey

## Installation Rapide

### Prérequis
- Godot 4.5 (télécharger depuis [godotengine.org](https://godotengine.org))
- Git (optionnel)

### Étapes

1. **Cloner le projet**
   ```bash
   git clone https://github.com/user/Ratz-odyssey.git
   cd Ratz-odyssey
   ```

2. **Ouvrir dans Godot**
   - Lancer Godot 4.5
   - Cliquer sur "Importer"
   - Sélectionner le dossier `Ratz-odyssey`
   - Cliquer sur "Ouvrir"

3. **Lancer le jeu**
   - Appuyer sur **F5** ou cliquer sur le bouton Play
   - Le jeu devrait démarrer avec le menu principal

## Contrôles Rapides

| Action | Clavier | Manette |
|--------|---------|---------|
| **Haut** | W | Stick ↑ |
| **Bas** | S | Stick ↓ |
| **Gauche** | A | Stick ← |
| **Droite** | D | Stick → |
| **Interagir** | E | A |
| **Menu** | Échap | Start |

## Premier Jeu

1. **Au menu principal**
   - Cliquer sur "Solo" pour jouer seul
   - Ou "Multijoueur" pour jouer à deux

2. **Dans le jeu**
   - Se déplacer avec WASD ou flèches
   - Approcher un NPC (point orange)
   - Appuyer sur E pour converser
   - Faire des choix de dialogue

3. **Menu retour**
   - Appuyer sur Échap pour revenir au menu

## Dossiers Importants

- **`scenes/`** - Fichiers de scène (.tscn)
- **`scripts/`** - Code GDScript (.gd)
- **`assets/`** - Sprites, sons, maps
- **`README.md`** - Documentation principale
- **`DEVELOPMENT.md`** - Guide de développement
- **`ROADMAP.md`** - Plan de développement
- **`TESTING.md`** - Guide de test

## Fichiers Clés

| Fichier | Utilité |
|---------|---------|
| `project.godot` | Config du projet |
| `scripts/game_manager.gd` | Singleton global |
| `scripts/main_menu.gd` | Menu principal |
| `scripts/dialogue_system.gd` | Dialogues |
| `scenes/main.tscn` | Scène principale |

## Mode de Développement

### Activer le Mode Debug
```gdscript
# Ajouter dans la console Godot (Ctrl+D)
print(GameManager.npc_relations)
```

### Raccourcis Utiles
- **F5** - Lancer le jeu
- **F6** - Pause
- **F7** - Profiler
- **F8** - Debugger
- **Ctrl+D** - Console
- **F4** - Fullscreen

## Troubleshooting

### "MainScene not found"
- Vérifier que `scenes/main.tscn` existe
- Vérifier le chemin dans `project.godot`

### "Script not found"
- Vérifier que tous les .gd sont dans `scripts/`
- Vérifier les chemins dans les ExtResource

### "Pas de sprites visibles"
- Les sprites manquent (à créer)
- Mais le jeu fonctionne sans

### "Dialogue ne s'affiche pas"
- Vérifier que `DialogueUI` est attaché à MainScene
- Checker la console pour les erreurs

## Prochaines Étapes

1. **Créer les sprites**
   - Rez et PNJ (idle, walk, attack)
   - Objets (fromage, télescope)

2. **Ajouter les animations**
   - Ajouter des SpriteFrames
   - Implémenter les transitions

3. **Développer Phase 2**
   - Améliorer les dialogues
   - Tester tous les PNJ

Voir [ROADMAP.md](ROADMAP.md) pour le plan complet.

## Ressources

- [Documentation Godot 4.5](https://docs.godotengine.org/en/stable/)
- [Godot Community](https://godotengine.org/community/overview)
- [GDScript Tutorial](https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/index.html)

## Support

- Vérifier [TESTING.md](TESTING.md) pour les tests
- Lire [DEVELOPMENT.md](DEVELOPMENT.md) pour développer
- Consulter [CAHIER_DES_CHARGES.md](../CAHIER_DES_CHARGES.md) pour les specs

---

**Bon jeu! 🎮**

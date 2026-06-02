# Architecture du Projet - Ratz Odyssey

## Vue d'Ensemble

```
Ratz Odyssey (Godot 4.5)
├── Frontend (UI)
│   ├── MainMenu → Sélection mode
│   └── DialogueUI → Interface dialogues
├── Game Logic (Gameplay)
│   ├── PlayerController → Mouvement 2 joueurs
│   ├── NPCManager → Interactions PNJ
│   └── CameraSystem → Suivi caméra
└── Core Systems
    ├── GameManager → État global
    ├── DialogueSystem → Dialogues arborescents
    └── RelationSystem → Relations PNJ
```

## Diagramme de Flux

```
START
  ↓
[Main Menu] ← Échap
  ├→ Solo Mode
  │   ↓
  │  [Main Scene] (1 joueur)
  │   ├→ Mouvement (WASD)
  │   ├→ Interactions PNJ (E)
  │   └→ Dialogues
  │   
  └→ Multi Mode
      ↓
     [Main Scene] (2 joueurs)
      ├→ Mouvement (2 × WASD)
      ├→ Interactions (2 × E)
      └→ Dialogues (partagés)
      
  ↓
[Game Over / Menu]
```

## Hiérarchie des Scènes

### MainMenu (UI)
```
MainMenu (Control)
├── ColorRect (background)
└── VBoxContainer
    ├── Title (Label "RATZ ODYSSEY")
    ├── SoloButton (Button)
    ├── MultiButton (Button)
    └── QuitButton (Button)
```

### MainScene (Game)
```
MainScene (Node2D)
├── TileMap (obstacles)
├── NPCs (Node2D container)
│   ├── NPC (Area2D) × 6
│   │   ├── Sprite2D
│   │   ├── CollisionShape2D
│   │   └── Label
│   └── ...
├── Player (CharacterBody2D) × 1-2
│   ├── CollisionShape2D
│   ├── AnimatedSprite2D
│   └── InteractionArea (Area2D)
├── Camera2D (suivi)
└── DialogueUI (Control)
    └── PanelContainer
        └── VBoxContainer
            ├── NPCNameLabel
            ├── DialogueText
            └── ChoicesContainer
```

## Système de Communication

```
INPUT (Contrôles)
  ↓
[Player.gd] (Mouvement)
  ↓
[GameManager] ← (État global)
  ↓ (Dialogue)
[NPC.gd] ← (Interaction)
  ↓
[DialogueSystem] (Arbre dialogue)
  ↓
[DialogueUI] ← (Affichage)
  ↓
[GameManager] (Mise à jour relations)
```

## Système de Relation

```
PNJ Score (0-100)
├── 0-29: Ennemi 🔴
│   ├── Attaque le joueur
│   └── Bloque le passage
├── 30-69: Neutre 🟡
│   ├── Accepte les quêtes
│   └── Dialogue normal
└── 70-100: Allié 🟢
    ├── Aide au combat
    └── Ouvre passages secrets
```

## Flux de Dialogue

```
[Approcher NPC]
  ↓
[Presser E]
  ↓
[NPC.start_dialogue()]
  ↓
[DialogueSystem.get_dialogue_node("initial")]
  ↓
[DialogueUI.show_dialogue()]
  ├→ Affiche texte
  └→ Affiche choix
  ↓
[Joueur clique choix]
  ↓
[NPC.process_choice(index)]
  ├→ Vérifier conditions
  ├→ Appliquer actions
  └→ Aller au nœud suivant
  ↓
[Boucle ou FIN]
```

## Système de Jeu Persistant

```
GameManager (Singleton/Autoload)
├── game_mode: "solo" | "multi"
├── current_players: 1 | 2
├── player_gold: int
├── inventory: Array[String]
├── story_flags: Dict[String, bool]
│   ├── "met_moka": false
│   ├── "has_cheese": false
│   ├── "has_telescope": false
│   └── "game_ended": false
└── npc_relations: Dict[String, int]
    ├── "griska": 50
    ├── "pip": 50
    ├── "torve": 50
    ├── "duc": 50
    ├── "skarl": 50
    ├── "triplettes": 50
    └── "moka": 100
```

## Système de Dialogue Arborescent

```
DialogueSystem
└── dialogue_tree: Dict
    └── [npc_id]: Dict
        └── [node_id]: Dict
            ├── text: String
            ├── choices: Array
            │   └── [choice]
            │       ├── text: String
            │       ├── next: String (node_id)
            │       ├── condition: String (optionnel)
            │       └── on_complete: String (action)
            └── on_complete: String (optionnel)
```

## Exemple Dialogue

```gdscript
dialogue_tree["griska"] = {
    "initial": {
        "text": "Bonjour, rat...",
        "choices": [
            {
                "text": "Tu connais le Saint Fromage?",
                "next": "griska_cheese_offer"
            }
        ]
    },
    "griska_cheese_offer": {
        "text": "Oui... 50 pièces pour l'info.",
        "choices": [
            {
                "text": "D'accord!",
                "next": "griska_end_paid",
                "condition": "has_gold_50"
            }
        ]
    },
    "griska_end_paid": {
        "text": "La tour est à l'est.",
        "choices": [],
        "on_complete": "griska_paid"
    }
}
```

## Contrôles et Mappages

```
Input Map (project.godot)
├── ui_up: W / ↑ / Stick↑
├── ui_down: S / ↓ / Stick↓
├── ui_left: A / ← / Stick←
├── ui_right: D / → / Stick→
├── interact: E / Enter / Button A
└── ui_cancel: Échap / Start

Joueur 1: Clavier
Joueur 2: Manette ou Clavier (même touches)
```

## Asset Pipeline

```
Asset Sources
├── Sprites
│   ├── Character PNG → SpriteFrames .tres
│   ├── NPC PNG → SpriteFrames .tres
│   └── Items PNG → Scenes
├── Maps
│   ├── Tilesheet PNG → TileSet .tres
│   └── TileMap .tscn
└── Audio
    ├── Musiques OGG/WAV
    └── SFX OGG/WAV
```

## Dépendances de Scripts

```
main_menu.gd
└── → GameManager.set_game_mode()
└── → get_tree().change_scene_to_file()

main.gd
└── → GameManager
└── → Player (instanciate)
└── → NPC (instanciate)
└── → DialogueSystem
└── → DialogueUI

player.gd
└── → GameManager (via NPC)
└── → Input.get_axis()

npc.gd
├── → GameManager.modify_npc_relation()
├── → GameManager.player_gold
├── → DialogueSystem
└── → DialogueUI.show_dialogue()

dialogue_system.gd
└── (Indépendant - données statiques)

dialogue_ui.gd
└── → NPC.process_choice()
└── → NPC.end_dialogue()

game_manager.gd
└── (Indépendant - singleton)
```

## Statuts de Développement

```
Phase 1: COMPLÉTÉE ✅
├── Menu principal ✅
├── Mouvement 2 joueurs ✅
├── Caméra ✅
└── Dialogues basiques ✅

Phase 2: PLANIFIÉE (2-3 semaines)
├── Sprites/Animations
├── Dialogues complets
├── Système relations UI
└── Premiers obstacles

Phase 3: PLANIFIÉE (4-5 semaines)
├── Maps complètes
├── Combats
├── Objets
└── Story complète

Phase 4: PLANIFIÉE (2-3 semaines)
├── Audio
├── Polish
└── QA finale
```

## Performance Targets

```
Solo Mode:
├── Target: 60 FPS
├── Max Entities: 10-15
└── Draw Calls: < 50

Multiplayer Mode:
├── Target: 30+ FPS
├── Max Entities: 12-20
└── Draw Calls: < 80

Memory:
├── Target: < 256 MB
├── Assets Cache: < 128 MB
└── Runtime: < 100 MB
```

## Extension Points

```
Facile à étendre:
├── Ajouter PNJ → dialogue_system.gd + main.gd
├── Ajouter dialogue → dialogue_system.gd
├── Ajouter action → npc.gd._handle_action()
├── Ajouter flag → GameManager.story_flags
├── Ajouter item → GameManager.inventory
└── Ajouter animation → player.gd._update_animation()

Modérément complexe:
├── Combat système
├── Tilemap obstacles
├── Quêtes multiples
└── Save/Load system

Complexe:
├── Cinématiques
├── AI avancée
├── Multijoueur réseau
└── Éditeur de cartes
```

---

**Version**: 1.0  
**Mise à jour**: 2 Juin 2025  
**Format**: Markdown + ASCII diagrams

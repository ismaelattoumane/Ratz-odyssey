# Guide de Développement - Ratz Odyssey

## Architecture du Jeu

### Gestionnaire Global (GameManager)
Le `GameManager` est un autoload (singleton) qui gère :
- État global du jeu (mode solo/multi)
- Relations des PNJ (0-100)
- Inventaire du joueur
- Flags de progression de l'histoire

### Système de Dialogue
Le `DialogueSystem` gère les dialogues arborescents avec :
- Arbre de dialogue par PNJ
- Conditions sur les choix
- Actions déclenchées par les dialogues

### Scène Principale
`MainScene` gère :
- Création des joueurs
- Caméra suivante
- Spawn des PNJ

### Interface de Dialogue
`DialogueUI` affiche :
- Texte du dialogue
- Boutons de choix
- Nom du PNJ

## Ajouter un Nouveau PNJ

### Étape 1: Ajouter les données au GameManager
```gdscript
# Dans game_manager.gd
npcs_data["nouveau_npc"] = {
    "relation": 50,
    "race": "Espèce",
    "role": "Rôle"
}
```

### Étape 2: Créer l'arbre de dialogue
```gdscript
# Dans dialogue_system.gd
dialogue_tree["nouveau_npc"] = {
    "initial": {
        "text": "Bonjour!",
        "choices": [
            {
                "text": "Option 1",
                "next": "nouveau_npc_option1"
            }
        ]
    },
    "nouveau_npc_option1": {
        "text": "Réponse à l'option 1",
        "choices": [],
        "on_complete": "nouveau_npc_done"
    }
}
```

### Étape 3: Ajouter les actions au NPC
```gdscript
# Dans npc.gd
func _handle_action(action: String):
    match action:
        "nouveau_npc_done":
            GameManager.modify_npc_relation(npc_id, 10)
```

### Étape 4: Ajouter le PNJ à la scène principale
```gdscript
# Dans main.gd
var npc_positions = {
    "nouveau_npc": Vector2(x, y)
}
```

## Système de Relation

### Scores
- **0-30** : Ennemi (attaque/bloque)
- **30-70** : Neutre (accepte quête)
- **70-100** : Allié (aide en combat/puzzle)

### Modifier les Relations
```gdscript
GameManager.modify_npc_relation("griska", 20)  # +20
GameManager.modify_npc_relation("griska", -10) # -10
```

### Vérifier le Statut
```gdscript
var status = GameManager.get_npc_status("griska")
# Retourne: "enemy", "neutral" ou "ally"
```

## Ajouter des Objets à l'Inventaire

```gdscript
GameManager.add_inventory_item("clé")
if GameManager.has_inventory_item("clé"):
    # faire quelque chose
```

## Flags de Progression

```gdscript
# Définir un flag
GameManager.story_flags["rencontre_moka"] = true

# Vérifier un flag
if GameManager.story_flags.get("rencontre_moka", false):
    # faire quelque chose
```

## Ajouter des Animations

### Créer un AnimatedSprite2D
1. Créer une ressource `SpriteFrames` (.tres)
2. Ajouter les animations (idle, walk, attack)
3. Assigner à le scène du joueur/NPC

### Jouer une animation
```gdscript
if animated_sprite != null:
    animated_sprite.play("walk")
```

## Système de Combat (À Venir)

Le système de combat permettra :
- Combats au tour par tour simples
- Esquive possible
- Bonus si allié

## Cinématiques (À Venir)

Les cinématiques finales afficheront:
- La fin "Fromage" : Rez rentre vivant
- La fin "Télescope" : Moka tue Rez (vraie fin)

## Conseils de Développement

1. Tester les dialogues dans la scène principale
2. Utiliser la console Godot pour déboguer
3. Respecter la convention de nommage (snake_case pour GDScript)
4. Documenter les nouveaux systèmes
5. Faire des commits réguliers

## Ressources Utiles

- [Documentation Godot 4.5](https://docs.godotengine.org/en/stable/)
- [GDScript Reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
- [Cahier des charges](../CAHIER_DES_CHARGES.md)

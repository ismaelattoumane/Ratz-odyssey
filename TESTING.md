# Guide de Test - Ratz Odyssey

## Configuration Initiale

### Étapes de Lancement
1. Ouvrir le projet dans Godot 4.5
2. Appuyer sur F5 pour lancer le jeu
3. Le menu principal devrait s'afficher

## Tests du Menu Principal

### Test 1: Mode Solo
1. Cliquer sur "Solo"
2. La scène principale devrait se charger avec un seul joueur

**Résultat attendu**: Un joueur au centre de l'écran avec une caméra qui le suit

### Test 2: Mode Multijoueur
1. Retourner au menu (Échap)
2. Cliquer sur "Multijoueur"
3. La scène principale devrait se charger avec deux joueurs

**Résultat attendu**: Deux joueurs proches l'un de l'autre avec une caméra partagée

### Test 3: Quitter
1. Cliquer sur "Quitter"

**Résultat attendu**: Le jeu se ferme

## Tests du Mouvement

### Joueur 1 (Clavier)
1. Presser **W/A/S/D** ou les **Flèches**
2. Le joueur devrait se déplacer dans les quatre directions

**Résultat attendu**: Mouvement fluide, caméra qui suit

### Joueur 2 (Manette/Clavier)
1. En multijoueur, presser **W/A/S/D** ou les **Flèches**
2. Le deuxième joueur devrait se déplacer

**Résultat attendu**: Les deux joueurs se déplacent indépendamment

## Tests des Dialogues

### Test 1: Interagir avec un PNJ
1. Approcher un PNJ
2. Presser **E** ou **Enter**
3. Le dialogue devrait s'afficher

**Résultat attendu**: Boîte de dialogue avec le nom du PNJ et le texte

### Test 2: Choisir une option
1. Cliquer sur une option de dialogue
2. Le dialogue devrait progresser

**Résultat attendu**: Affichage de la réponse et nouvelles options

### Test 3: Terminer un dialogue
1. Continuer jusqu'à la fin du dialogue
2. Presser "Continuer" ou attendre

**Résultat attendu**: Fermeture de la boîte de dialogue, le joueur peut se déplacer

## Tests du Système de Relation

### Vérifier les Relations
1. Appuyer sur F1 (ou modifier pour afficher) pour voir les scores
2. Les relations devraient afficher (0-100)

**Résultat attendu**: Les valeurs initiales sont à 50

### Modifier une Relation
1. Faire un choix de dialogue qui modifie une relation
2. Vérifier le nouveau score

**Résultat attendu**: Le score change en fonction du choix

## Tests du Mode Multijoueur

### Test de Collaboration
1. Lancer en mode multijoueur
2. Faire progresser les deux joueurs ensemble dans un dialogue

**Résultat attendu**: Bonus de relation (+20%) appliqué

## Checklist de Bugs Connus

- [ ] Les animations ne s'affichent pas (les sprites sont manquants)
- [ ] Le dialogue ne s'affiche pas en arrière-plan de la scène
- [ ] La caméra multijoueur ne suit pas correctement les deux joueurs
- [ ] Les collisions ne fonctionnent pas avec les obstacles

## Prochaines Phases de Test

### Phase 2: Animations
- Créer et tester les sprites du joueur (idle, walk)
- Tester les animations des PNJ

### Phase 3: Combat
- Tester les combats simples
- Vérifier l'esquive

### Phase 4: Objets
- Tester la collecte d'objets
- Vérifier l'inventaire

### Phase 5: Cinématiques
- Tester les deux fins
- Vérifier les transitions

## Raccourcis de Débogage

Pour activer des fonctionnalités de débogage, ajouter dans la console Godot:

```gdscript
# Voir les scores de relation
print(GameManager.npc_relations)

# Ajouter de l'or
GameManager.add_gold(100)

# Modifier une relation
GameManager.modify_npc_relation("griska", 50)

# Ajouter un item à l'inventaire
GameManager.add_inventory_item("clé")

# Vérifier l'inventaire
print(GameManager.inventory)
```

## Rapporter les Bugs

Créer un rapport de bug avec:
1. **Description**: Que s'est-il passé?
2. **Étapes**: Comment reproduire?
3. **Résultat attendu**: Quoi aurait dû se passer?
4. **Résultat actuel**: Quoi s'est passé réellement?
5. **Captures d'écran**: Si applicable

Exemple:
```
Titre: Dialogue ne ferme pas après choix

Description: 
Quand j'appuie sur une option de dialogue, la boîte de dialogue ne se ferme pas.

Étapes pour reproduire:
1. Lancer le jeu
2. Approcher un PNJ
3. Appuyer sur E pour dialoguer
4. Appuyer sur une option de dialogue

Résultat attendu:
La boîte de dialogue devrait afficher la réponse ou se fermer

Résultat actuel:
Rien ne se passe, la boîte reste vide
```

## Performances

### Cibles
- 60 FPS en mode solo
- 30+ FPS en mode multijoueur
- Temps de chargement < 2 secondes

### Vérifier les performances
1. Outils → Moniteur (F7)
2. Observer FPS et utilisation mémoire

## Recommandations de Test

- Tester sur différentes résolutions
- Tester avec clavier et manette
- Tester solo et multijoueur
- Tester les transitions entre scènes
- Tester les conditions de dialogue
- Vérifier l'audio (quand disponible)

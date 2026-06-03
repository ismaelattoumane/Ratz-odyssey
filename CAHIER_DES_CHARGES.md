# RATZ ODYSSEY — Cahier des Charges

## 1. CONCEPT GÉNÉRAL

**Genre** : RPG 2D / 2.5D pixel-art  
**Plateforme** : PC (Godot 4.5)  
**Joueurs** : 1-2 (local co-op, manette + clavier)  
**Durée** : 30-45 min par partie  

---

## 2. HISTOIRE

### Prémisse
Rez, un rat solitaire, cherche le **Saint Fromage** — une légende capable d'exaucer un vœu.

### Actes
1. **Acte 1** — La Route
   - Rez quitte son terrier
   - Rencontre 5-6 PNJ
   - Chaque rencontre = choix (allié ou ennemi)

2. **Acte 2** — La Tour du Fromage
   - Progression linéaire/puzzle
   - Alliés aident, ennemis bloquent
   - Combats ou esquives

3. **Acte 3** — Le Choix Final
   - Deux objets trouvés : **Fromage** ou **Télescope**
   - Cinématique basée sur le choix

### Fins

| Fin | Objet | Condition | Résultat |
|-----|-------|-----------|----------|
| **Facile** | Fromage | Prendre le fromage | Rez rentre. Vivant. FIN |
| **Difficile** | Télescope | Prendre le télescope | Moka tue Rez. VRAIE FIN |

---

## 3. GAMEPLAY

### Mécaniques Principales

**Mouvement**
- WASD / Flèches = clavier
- Stick gauche = manette
- Caméra suit le joueur

**Interactions**
- Parler à PNJ → dialogue + choix
- Ramasser objets
- Ouvrir portes/coffres

**Système de Relation**
- PNJ = score (0-100)
  - 0-30 : Ennemi (attaque/bloque)
  - 30-70 : Neutre (accepte quête)
  - 70-100 : Allié (aide en combat/puzzle)

**Combat/Puzzle**
- Combat simple : frapper (barre d'énergie)
- Puzzle : allumettes, leviers, clés
- Fuite possible : plus de points PNJ si réussi

---

## 4. PERSONNAGES

### Joueur
**Rez** (Rat) — malin, naïf, curieux

### PNJ Alliés Potentiels
| Nom | Race | Rôle | Allié Si... |
|-----|------|------|-------------|
| **Griska** | Taupe | Marchande/Guide | Achat info ou aide gratuit |
| **Pip** | Souris | Voleur repenti | Aide à voler clé du Duc |
| **Torve** | Rat | Garde déserteur | Combat ensemble |

### PNJ Ennemis Potentiels
| Nom | Race | Rôle | Ennemi Si... |
|-----|------|------|-------------|
| **Le Duc** | Rat | Noble avide | Refuse son allégeance |
| **Skarl** | Serpent | Mercenaire | Aide les ennemis de Skarl |
| **Triplettes** | Souris | Espionnes | Trahir leur secret |

### Antagoniste Principal
**Moka** (Rat) — ancien ami caché
- Révélation : Acte 3
- Garde le télescope depuis des années
- Tue Rez si télescope pris

---

## 5. MONDES

### Carte Principale
- **Terrier** → Point de départ (accueil chaleureux)
- **Forêt** → PNJ = Griska, combats faciles
- **Château du Duc** → Ennemi principal, puzzle complexe
- **Caverne** → Finale, deux choix
- **Retour Terrier** (si Fromage) → Fin facile

### Design
- Tileset 16x16
- Parallaxe simple (2-3 couches)
- Collision sur les murs/obstacles

---

## 6. DIALOGUES

### Système
- Dialogues arbre (branch + condition)
- Exemple Griska :
  ```
  [Griska]
  "Bonjour, rat. Tu cherches quelque chose ?"
  
  → Choix 1 "Tu connais le Saint Fromage ?"
     [Griska] "Oui... dangereux. 50 pièces pour l'info."
     → Payer (loose -50 gold) → Griska devient allié
     → Refuser → Griska neutre
  
  → Choix 2 "Rien. Laisse-moi tranquille."
     [Griska] "Bah, un jour tu reviendras."
  ```

### Distribution
- 5-6 dialogues clés par PNJ
- Changements de texte selon relation

---

## 7. MODES DE JEU

### Solo
- 1 joueur, clavier
- Caméra fixe suivant Rez

### Multijoueur Local
- 2 joueurs (clavier + manette)
- Caméra partagée
- Collaboration = bonus (+20 % PNJ score si aidé ensemble)

---

## 8. INTERFACE

### Menu Principal
```
┌──────────────────┐
│  RATZ ODYSSEY    │
├──────────────────┤
│   [Solo]  [Multi]│
└──────────────────┘
```

### HUD In-Game
- **Top-left** : Nom du PNJ actuel (si en dialogue)
- **Top-right** : Objet équipé
- **Bottom-left** : Relation scores (si cheat enabled)

### Dialogue Box
```
┌─────────────────────┐
│ [PNJ Name]          │
│ "Dialogue texte..." │
│ → Choix 1           │
│ → Choix 2           │
└─────────────────────┘
```

---

## 9. ASSETS REQUIS

### Sprites
- [ ] Rez (idle, walk, attack)
- [ ] 6 PNJ (idle, dialogue, hurt)
- [ ] Moka (révélation)
- [ ] Objets (fromage, télescope, clés, coffres)

### Tilesets
- [ ] Herbe / Rochers (forêt)
- [ ] Murs / Portes (château)
- [ ] Roche / Cristaux (caverne)

### Audio
- [ ] Musique ambiance (boucle 2 min)
- [ ] SFX (pas, dialogue, coup, mort)
- [ ] Jingle victoire / défaite

### Polices UI
- [ ] Font titre (gras, 32px)
- [ ] Font dialogue (régulier, 16px)

---

## 10. TECHNIQUE

### Engine : Godot 4.5
### Scripts GDScript
```
scripts/
├── player.gd          (mouvement 2 joueurs)
├── main.gd            (spawn & gestion scène)
├── main_menu.gd       (menu départ)
├── npc.gd             (dialogue + relation)
├── game_manager.gd    (singleton)
└── dialogue_system.gd (arbre dialogues)
```

### Scènes
```
scenes/
├── main_menu.tscn
├── main.tscn          (niveau principal)
├── player.tscn        (joueur)
├── npc.tscn           (template PNJ)
└── dialogue_ui.tscn   (boîte dialogue)
```

---

## 11. PHASES DE DÉVELOPPEMENT

### Phase 1 (ACTUEL) ✓
- [x] Menu départ solo/multi
- [x] Mouvement clavier + manette
- [x] Caméra suivante
- [x] TileMap basique

### Phase 2 (PROCHAIN)
- [ ] Système de dialogue (arbre simple)
- [ ] 3 PNJ de test
- [ ] Relation scoring
- [ ] Animations marche/idle

### Phase 3
- [ ] Complet les 6 PNJ
- [ ] Système de combat/esquive
- [ ] Objets collectibles
- [ ] Cinématiques finale

### Phase 4
- [ ] Sound design
- [ ] Polish visuel (effets, feedback)
- [ ] QA & bug fix
- [ ] Balancing (difficulté, temps)

---

## 12. CONTRÔLES

| Action | Clavier | Manette |
|--------|---------|---------|
| Haut | W / ↑ | Stick ↑ |
| Bas | S / ↓ | Stick ↓ |
| Gauche | A / ← | Stick ← |
| Droite | D / → | Stick → |
| Valider | E / Enter | A |
| Menu | Échap | Start |

---

## 13. PRIORITÉS

1. **ESSENTIEL** : Mouvement + Menu + Dialogue
2. **IMPORTANT** : 3 PNJ + Système relation
3. **BON À AVOIR** : Animations, sons, polish
4. **OPTIONAL** : Combats détaillés, sidequests

---

**Version 1.0** — Juin 2025

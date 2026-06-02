extends Node

# Singleton pour gérer l'état global du jeu

signal game_mode_changed(mode: String)

var game_mode: String = "solo"  # solo ou multi
var current_players: int = 1
var npc_relations: Dictionary = {}  # {npc_name: score (0-100)}
var player_gold: int = 0
var inventory: Array = []
var story_flags: Dictionary = {}  # Flags pour la progression de l'histoire

# PNJ et leurs états initiaux
var npcs_data: Dictionary = {
	"griska": {"relation": 50, "race": "Taupe", "role": "Marchande/Guide"},
	"pip": {"relation": 50, "race": "Souris", "role": "Voleur repenti"},
	"torve": {"relation": 50, "race": "Rat", "role": "Garde déserteur"},
	"duc": {"relation": 50, "race": "Rat", "role": "Noble avide"},
	"skarl": {"relation": 50, "race": "Serpent", "role": "Mercenaire"},
	"triplettes": {"relation": 50, "race": "Souris", "role": "Espionnes"},
	"moka": {"relation": 100, "race": "Rat", "role": "Antagoniste"}
}

func _ready():
	# Initialiser les relations
	for npc_name in npcs_data.keys():
		npc_relations[npc_name] = npcs_data[npc_name]["relation"]
	
	# Flag d'histoire
	story_flags["met_moka"] = false
	story_flags["has_cheese"] = false
	story_flags["has_telescope"] = false
	story_flags["game_ended"] = false

func set_game_mode(mode: String):
	game_mode = mode
	current_players = 2 if mode == "multi" else 1
	game_mode_changed.emit(mode)

func get_npc_relation(npc_name: String) -> int:
	return npc_relations.get(npc_name, 50)

func modify_npc_relation(npc_name: String, amount: int):
	npc_relations[npc_name] = clampi(npc_relations[npc_name] + amount, 0, 100)

func get_npc_status(npc_name: String) -> String:
	var score = npc_relations.get(npc_name, 50)
	if score < 30:
		return "enemy"
	elif score < 70:
		return "neutral"
	else:
		return "ally"

func add_gold(amount: int):
	player_gold += amount

func add_inventory_item(item: String):
	inventory.append(item)

func has_inventory_item(item: String) -> bool:
	return item in inventory

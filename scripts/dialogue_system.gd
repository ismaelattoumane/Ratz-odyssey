# Système de dialogue arborescent
class_name DialogueSystem
extends RefCounted

var dialogue_tree: Dictionary = {}

func _init():
	_setup_dialogues()

func _setup_dialogues():
	# Dialogues de Griska
	dialogue_tree["griska"] = {
		"initial": {
			"text": "Bonjour, rat. Tu cherches quelque chose ?",
			"choices": [
				{
					"text": "Tu connais le Saint Fromage ?",
					"next": "griska_cheese_offer"
				},
				{
					"text": "Rien. Laisse-moi tranquille.",
					"next": "griska_leave"
				}
			]
		},
		"griska_cheese_offer": {
			"text": "Oui... dangereux. 50 pièces pour l'info.",
			"choices": [
				{
					"text": "D'accord, prends mes 50 pièces.",
					"next": "griska_end_paid",
					"condition": "has_gold_50"
				},
				{
					"text": "C'est trop cher. Laisse-moi.",
					"next": "griska_leave"
				}
			]
		},
		"griska_end_paid": {
			"text": "Bon choix. La tour se trouve à l'est. Sois prudent.",
			"choices": [],
			"on_complete": "griska_paid"
		},
		"griska_leave": {
			"text": "Bah, un jour tu reviendras.",
			"choices": [],
			"on_complete": "griska_left"
		}
	}
	
	# Dialogues de Pip
	dialogue_tree["pip"] = {
		"initial": {
			"text": "Psst! Tu veux un coup de main ? Je suis le meilleur voleur de la région.",
			"choices": [
				{
					"text": "Aide-moi à voler la clé du Duc.",
					"next": "pip_heist"
				},
				{
					"text": "Non, tu me fais peur.",
					"next": "pip_leave"
				}
			]
		},
		"pip_heist": {
			"text": "Ha! Je savais que tu étais mon ami. Suis-moi!",
			"choices": [],
			"on_complete": "pip_ally"
		},
		"pip_leave": {
			"text": "Tant pis pour toi, mon ami.",
			"choices": [],
			"on_complete": "pip_left"
		}
	}
	
	# Dialogues de Torve
	dialogue_tree["torve"] = {
		"initial": {
			"text": "Salut, camarade. On dirait que tu as du potentiel.",
			"choices": [
				{
					"text": "Veux-tu m'aider ?",
					"next": "torve_join"
				},
				{
					"text": "Je me débrouille seul.",
					"next": "torve_leave"
				}
			]
		},
		"torve_join": {
			"text": "Avec plaisir! Nous ratous devons nous entraider.",
			"choices": [],
			"on_complete": "torve_ally"
		},
		"torve_leave": {
			"text": "Comme tu veux. Bonne chance.",
			"choices": [],
			"on_complete": "torve_left"
		}
	}
	
	# Dialogues du Duc
	dialogue_tree["duc"] = {
		"initial": {
			"text": "Ah, un misérable rat. Que fais-tu dans mon château ?",
			"choices": [
				{
					"text": "Je cherche le Saint Fromage.",
					"next": "duc_refuse"
				},
				{
					"text": "Je me soumets à ton autorité, mon seigneur.",
					"next": "duc_allied"
				}
			]
		},
		"duc_refuse": {
			"text": "INSOLENT! Gardes, à l'attaque!",
			"choices": [],
			"on_complete": "duc_enemy"
		},
		"duc_allied": {
			"text": "Bien, au moins tu es respectueux. Je vais te laisser passer.",
			"choices": [],
			"on_complete": "duc_ally"
		}
	}

func get_dialogue_node(npc: String, node_id: String) -> Dictionary:
	if dialogue_tree.has(npc):
		if dialogue_tree[npc].has(node_id):
			return dialogue_tree[npc][node_id].duplicate(true)
	return {}

func get_initial_dialogue(npc: String) -> Dictionary:
	return get_dialogue_node(npc, "initial")

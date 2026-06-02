extends Area2D

class_name NPC

@export var npc_name: String = "Griska"
@export var npc_id: String = "griska"

var dialogue_system: DialogueSystem
var current_dialogue_node: String = "initial"
var can_interact: bool = false
var player_ref: Node2D = null

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D

func _ready():
	dialogue_system = DialogueSystem.new()
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _physics_process(_delta):
	if can_interact and Input.is_action_just_pressed("interact"):
		start_dialogue()

func _on_area_entered(area):
	if area is Player:
		can_interact = true
		player_ref = area

func _on_area_exited(area):
	if area is Player:
		can_interact = false
		player_ref = null

func start_dialogue():
	if player_ref == null:
		return
	
	player_ref.set_in_dialogue(true)
	current_dialogue_node = "initial"
	show_dialogue_node(current_dialogue_node)

func show_dialogue_node(node_id: String):
	var node = dialogue_system.get_dialogue_node(npc_id, node_id)
	if node.is_empty():
		return
	
	# Afficher le dialogue dans la UI (sera implémenté dans DialogueUI)
	if get_tree().root.has_node("MainScene/DialogueUI"):
		var dialogue_ui = get_tree().root.get_node("MainScene/DialogueUI")
		dialogue_ui.show_dialogue(npc_name, node, self)
	else:
		push_error("DialogueUI non trouvé")

func end_dialogue():
	if player_ref != null:
		player_ref.set_in_dialogue(false)
	current_dialogue_node = "initial"

func process_choice(choice_index: int):
	var node = dialogue_system.get_dialogue_node(npc_id, current_dialogue_node)
	if node.is_empty() or choice_index >= node.get("choices", []).size():
		return
	
	var choice = node["choices"][choice_index]
	
	# Vérifier les conditions
	if choice.has("condition"):
		if not _check_condition(choice["condition"]):
			return
	
	# Traiter les actions
	if choice.has("on_complete"):
		_handle_action(choice["on_complete"])
	
	# Aller au nœud suivant
	if choice.has("next"):
		current_dialogue_node = choice["next"]
		show_dialogue_node(current_dialogue_node)
	else:
		end_dialogue()

func _check_condition(condition: String) -> bool:
	match condition:
		"has_gold_50":
			return GameManager.player_gold >= 50
		_:
			return true

func _handle_action(action: String):
	match action:
		"griska_paid":
			GameManager.add_gold(-50)
			GameManager.modify_npc_relation(npc_id, 20)
		"griska_left":
			pass  # Rien
		"pip_ally":
			GameManager.modify_npc_relation(npc_id, 30)
		"pip_left":
			GameManager.modify_npc_relation(npc_id, -10)
		"torve_ally":
			GameManager.modify_npc_relation(npc_id, 30)
		"torve_left":
			pass
		"duc_enemy":
			GameManager.modify_npc_relation(npc_id, -40)
		"duc_ally":
			GameManager.modify_npc_relation(npc_id, 25)

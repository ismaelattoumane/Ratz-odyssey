extends Control

class_name DialogueUI

@onready var panel = $PanelContainer
@onready var npc_label = $PanelContainer/VBoxContainer/NPCNameLabel
@onready var dialogue_label = $PanelContainer/VBoxContainer/DialogueText
@onready var choices_container = $PanelContainer/VBoxContainer/ChoicesContainer

var current_npc: NPC = null
var current_dialogue_node: Dictionary = {}

func _ready():
	panel.hide()

func show_dialogue(npc_name: String, dialogue_node: Dictionary, npc: NPC):
	current_npc = npc
	current_dialogue_node = dialogue_node
	
	npc_label.text = npc_name
	dialogue_label.text = dialogue_node.get("text", "")
	
	# Afficher les choix
	_show_choices(dialogue_node.get("choices", []))
	
	panel.show()

func _show_choices(choices: Array):
	# Supprimer les anciens boutons
	for child in choices_container.get_children():
		child.queue_free()
	
	if choices.size() == 0:
		# Aucun choix, créer un bouton "Continuer"
		var continue_btn = Button.new()
		continue_btn.text = "Continuer"
		continue_btn.pressed.connect(_on_continue)
		choices_container.add_child(continue_btn)
		return
	
	# Créer les boutons de choix
	for i in range(choices.size()):
		var choice = choices[i]
		var btn = Button.new()
		btn.text = choice.get("text", "Choix")
		btn.pressed.connect(_on_choice_selected.bindv([i]))
		choices_container.add_child(btn)

func _on_choice_selected(index: int):
	if current_npc != null:
		current_npc.process_choice(index)
		_check_dialogue_end()

func _on_continue():
	if current_npc != null:
		current_npc.end_dialogue()
		panel.hide()

func _check_dialogue_end():
	# Vérifier si le dialogue est terminé
	if current_npc == null:
		return
	
	var node = current_npc.dialogue_system.get_dialogue_node(current_npc.npc_id, current_npc.current_dialogue_node)
	if node.is_empty() or node.get("choices", []).size() == 0:
		# Dialogue terminé
		await get_tree().process_frame
		_on_continue()

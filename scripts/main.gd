extends Node2D

class_name MainScene

var player1: Player
var player2: Player
var camera: Camera2D
var dialogue_system: DialogueSystem

@onready var npcs_container = $NPCs
@onready var dialogue_ui = $DialogueUI

func _ready():
	dialogue_system = DialogueSystem.new()
	
	# Créer les joueurs selon le mode de jeu
	_setup_players()
	_setup_camera()
	_spawn_npcs()

func _setup_players():
	player1 = load("res://scenes/player.tscn").instantiate()
	player1.player_id = 1
	player1.position = Vector2(640, 360)
	add_child(player1)
	
	if GameManager.game_mode == "multi":
		player2 = load("res://scenes/player.tscn").instantiate()
		player2.player_id = 2
		player2.position = Vector2(700, 360)
		add_child(player2)

func _setup_camera():
	camera = Camera2D.new()
	add_child(camera)
	camera.enabled = true
	camera.set_physics_process(true)
	
	if GameManager.game_mode == "solo":
		if player1 != null:
			camera.global_position = player1.global_position
	else:
		# En multijoueur, la caméra suit les deux joueurs
		if player1 != null and player2 != null:
			var center = (player1.global_position + player2.global_position) / 2
			camera.global_position = center

func _process(_delta):
	if camera != null:
		if GameManager.game_mode == "solo" and player1 != null:
			camera.global_position = player1.global_position.lerp(camera.global_position, 0.1)
		elif player2 != null and player1 != null:
			var center = (player1.global_position + player2.global_position) / 2
			camera.global_position = center.lerp(camera.global_position, 0.1)

func _spawn_npcs():
	# Créer les PNJ
	var npc_positions = {
		"griska": Vector2(300, 300),
		"pip": Vector2(500, 200),
		"torve": Vector2(800, 400),
		"duc": Vector2(600, 150),
		"skarl": Vector2(900, 500),
		"triplettes": Vector2(200, 500)
	}
	
	for npc_name in npc_positions:
		var npc = load("res://scenes/npc.tscn").instantiate()
		npc.npc_id = npc_name
		npc.npc_name = npc_name.to_upper()
		npc.position = npc_positions[npc_name]
		npcs_container.add_child(npc)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

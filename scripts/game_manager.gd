extends Node

class_name GameManager

static var instance: GameManager

var current_scene: Node
var player: Player

func _ready() -> void:
	if instance == null:
		instance = self
		set_multiplayer_authority(1)
	else:
		queue_free()

func load_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)

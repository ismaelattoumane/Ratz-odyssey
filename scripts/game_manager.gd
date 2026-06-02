extends Node
class_name GameManager

static var instance: GameManager

var mode: String = "solo"  # "solo" ou "multi"

func _ready() -> void:
	if instance == null:
		instance = self
	else:
		queue_free()

func load_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)

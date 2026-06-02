extends CanvasLayer

func _on_solo_pressed() -> void:
	GM.instance.mode = "solo"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_multi_pressed() -> void:
	GM.instance.mode = "multi"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

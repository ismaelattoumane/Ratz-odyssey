extends CanvasLayer

@export var player_scene: PackedScene

func _ready() -> void:
	var mode = GM.instance.mode

	if mode == "solo":
		_spawn_player(-1, Vector2(640, 360))
	else:
		# Joueur 1 = clavier
		_spawn_player(-1, Vector2(540, 360))
		# Joueur 2 = manette 0
		_spawn_player(0, Vector2(740, 360))

func _spawn_player(device: int, pos: Vector2) -> void:
	var p = player_scene.instantiate()
	p.device_id = device
	p.position = pos
	add_child(p)

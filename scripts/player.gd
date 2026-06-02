extends CharacterBody2D

class_name Player

@export var speed: float = 200.0
@export var acceleration: float = 1500.0

var player_id: int = 1  # 1 pour joueur 1 (clavier), 2 pour joueur 2 (manette)
var input_axis: Vector2 = Vector2.ZERO
var current_direction: Vector2 = Vector2.DOWN

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

var in_dialogue: bool = false

func _ready():
	if animated_sprite == null:
		push_error("AnimatedSprite2D non trouvé pour le joueur ", player_id)

func _physics_process(delta):
	if in_dialogue:
		velocity = Vector2.ZERO
		return
	
	_handle_input()
	_apply_movement(delta)
	_update_animation()
	move_and_slide()

func _handle_input():
	input_axis = Vector2.ZERO
	
	if player_id == 1:
		# Joueur 1: Clavier
		input_axis.x = Input.get_axis("ui_left", "ui_right")
		input_axis.y = Input.get_axis("ui_up", "ui_down")
	elif player_id == 2:
		# Joueur 2: Manette (joystick analogue ou boutons)
		input_axis.x = Input.get_axis("ui_left", "ui_right")
		input_axis.y = Input.get_axis("ui_up", "ui_down")
	
	# Normaliser pour éviter le mouvement diagonal plus rapide
	input_axis = input_axis.normalized()

func _apply_movement(delta):
	if input_axis != Vector2.ZERO:
		velocity = velocity.lerp(input_axis * speed, acceleration * delta)
		current_direction = input_axis
	else:
		velocity = velocity.lerp(Vector2.ZERO, acceleration * delta)

func _update_animation():
	if animated_sprite == null:
		return
	
	if velocity.length() > 0:
		# Jouer l'animation de marche
		if animated_sprite.animation != "walk":
			animated_sprite.play("walk")
	else:
		# Jouer l'animation idle
		if animated_sprite.animation != "idle":
			animated_sprite.play("idle")

func set_in_dialogue(value: bool):
	in_dialogue = value
	if in_dialogue:
		velocity = Vector2.ZERO

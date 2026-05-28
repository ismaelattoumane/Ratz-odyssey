extends CharacterBody2D

class_name Player

const SPEED = 200.0
const ACCELERATION = 1200.0
const FRICTION = 800.0

@export var is_controlled: bool = true

var _velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	print("Player initialized")

func _physics_process(delta: float) -> void:
	if not is_controlled:
		return
	
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_vector != Vector2.ZERO:
		_velocity = _velocity.move_toward(input_vector.normalized() * SPEED, ACCELERATION * delta)
	else:
		_velocity = _velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = _velocity
	move_and_slide()

func get_direction() -> Vector2:
	return velocity.normalized() if velocity.length() > 0 else Vector2.DOWN

extends CharacterBody2D
class_name Player

const SPEED = 200.0
const ACCELERATION = 1200.0
const FRICTION = 800.0

var _velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Clavier (WASD / flèches) + Manette (stick gauche)
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_vector != Vector2.ZERO:
		_velocity = _velocity.move_toward(input_vector.normalized() * SPEED, ACCELERATION * delta)
	else:
		_velocity = _velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = _velocity
	move_and_slide()

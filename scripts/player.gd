extends CharacterBody2D
class_name Player

const SPEED = 200.0
const ACCELERATION = 1200.0
const FRICTION = 800.0

@export var device_id: int = -1  # -1 = clavier, 0+ = manette

var _velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var input_vector: Vector2 = Vector2.ZERO

	if device_id == -1:
		input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	else:
		input_vector = Vector2(
			Input.get_joy_axis(device_id, JOY_AXIS_LEFT_X),
			Input.get_joy_axis(device_id, JOY_AXIS_LEFT_Y)
		)
		if input_vector.length() < 0.2:
			input_vector = Vector2.ZERO

	if input_vector != Vector2.ZERO:
		_velocity = _velocity.move_toward(input_vector.normalized() * SPEED, ACCELERATION * delta)
	else:
		_velocity = _velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = _velocity
	move_and_slide()

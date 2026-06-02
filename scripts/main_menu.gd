extends Control

@onready var solo_button = $VBox/SoloButton
@onready var multi_button = $VBox/MultiButton
@onready var quit_button = $VBox/QuitButton

func _ready():
	solo_button.pressed.connect(_on_solo_pressed)
	multi_button.pressed.connect(_on_multi_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_solo_pressed():
	GameManager.set_game_mode("solo")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_multi_pressed():
	GameManager.set_game_mode("multi")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_quit_pressed():
	get_tree().quit()

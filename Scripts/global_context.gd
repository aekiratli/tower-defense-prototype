extends Node

@onready var width: int = 1920
@onready var height: int = 1080
@onready var castle_location_x: float = width / 2
@onready var castle_location_y: float = height / 2
@onready var skeleton_spawn_timer: float = 1
signal skeleton_clicked(is_entered: bool, selected_skeleton: CharacterBody2D)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

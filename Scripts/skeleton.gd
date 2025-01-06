class_name Skeleton extends Node2D

@onready var skeleton: CharacterBody2D = $SkeletonBody
@onready var attack_point : Vector2 = Vector2(GlobalContext.castle_location_x, GlobalContext.castle_location_y)
var  spawn_x: float
var  spawn_y: float
var speed: float = 800.0


func _ready() -> void:
	skeleton.position.x = spawn_x
	skeleton.position.y = spawn_y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = (attack_point - skeleton.position).normalized()
	var distance_to_attack_point = skeleton.position.distance_to(attack_point)
	var velocity = direction * speed
	skeleton.velocity = velocity
	skeleton.move_and_slide()


func _on_skeleton_body_mouse_entered() -> void:
	GlobalContext.skeleton_clicked.emit(true, skeleton)


func _on_skeleton_body_mouse_exited() -> void:
	GlobalContext.skeleton_clicked.emit(false, null)

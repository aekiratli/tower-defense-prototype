extends Sprite2D
const CROSSHAIR = preload("res://Prefabs/Crosshair.tscn")
var enemies_in_attack_area: Array[CharacterBody2D] = []
var max_enemies_to_track: int = 50
var current_n_of_enemies_in_zone: int = 0
var crosshair
var crosshair_is_entered: bool = false
var hovered_skeleton: CharacterBody2D
var selected_skeleton: CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = GlobalContext.castle_location_x
	position.y = GlobalContext.castle_location_y
	var Crosshair = CROSSHAIR.instantiate()
	Crosshair.global_position.x = -500
	Crosshair.global_position.y = -500
	get_parent().call_deferred("add_child", Crosshair)
	crosshair = Crosshair
	GlobalContext.skeleton_clicked.connect(_skeleton_clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var enemy_position = _track_enemy_position()
	crosshair.global_position.x = enemy_position.x
	crosshair.global_position.y = enemy_position.y
	if Input.is_action_just_pressed("right_click") and crosshair_is_entered:
		enemies_in_attack_area.pop_back()
		enemies_in_attack_area.push_front(hovered_skeleton)
		
		
func _on_attack_area_body_entered(body: Node2D) -> void:
	if current_n_of_enemies_in_zone < max_enemies_to_track and body.name == 'SkeletonBody':
		current_n_of_enemies_in_zone = current_n_of_enemies_in_zone + 1
		enemies_in_attack_area.append(body)

func _track_enemy_position() -> Vector2:
	if enemies_in_attack_area:
		var enemy = enemies_in_attack_area[0]
		return enemy.position
	else:
		return Vector2()

func _skeleton_clicked(is_entered: bool, body: CharacterBody2D):
	crosshair_is_entered = is_entered
	hovered_skeleton = body

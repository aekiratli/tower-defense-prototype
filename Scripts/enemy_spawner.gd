extends Node
@onready var skeleton_timer: Timer = $"../Timers/Skeleton Timer"

const SKELETON = preload("res://Prefabs/Enemies/Skeleton.tscn")
enum SPAWN_AREA { TOP, BOTTOM, LEFT, RIGHT }
var skeleton_spawn_radius: float = 100
var max_skeletons_spawn: int = 5

func _ready() -> void:
	skeleton_timer.wait_time = GlobalContext.skeleton_spawn_timer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# random enum value for border

	pass

func _spawn_skeleton() -> void:
	var amount = randi() % max_skeletons_spawn
	var skeleton_spawn_pos_x: float
	var skeleton_spawn_pos_y: float
	var spawn_area = randi() % SPAWN_AREA.size()  # Randomly select a spawn area
	match spawn_area:
		SPAWN_AREA.TOP:
			skeleton_spawn_pos_x = randf() * GlobalContext.width
			skeleton_spawn_pos_y = 0
		SPAWN_AREA.BOTTOM:
			skeleton_spawn_pos_x = randf() * GlobalContext.width
			skeleton_spawn_pos_y = GlobalContext.height
		SPAWN_AREA.LEFT:
			skeleton_spawn_pos_x = 0
			skeleton_spawn_pos_y = randf() * GlobalContext.height
		SPAWN_AREA.RIGHT:
			skeleton_spawn_pos_x = GlobalContext.width
			skeleton_spawn_pos_y = randf() * GlobalContext.height


	for i in range(amount):
		var skeleton = SKELETON.instantiate()
		var angle = randf() * PI * 2
		var radius = randf() * skeleton_spawn_radius
		skeleton.spawn_x = skeleton_spawn_pos_x + cos(angle) * radius
		skeleton.spawn_y = skeleton_spawn_pos_y + sin(angle) * radius
		add_child(skeleton)


func _on_skeleton_timer_timeout() -> void:
	_spawn_skeleton()

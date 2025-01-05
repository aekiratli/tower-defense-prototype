extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = GlobalContext.castle_location_x
	position.y = GlobalContext.castle_location_y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

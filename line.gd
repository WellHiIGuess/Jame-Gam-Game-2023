extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_point(Vector2(0.0, 0.0))
	add_point(Vector2(0.0, 0.0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_local_mouse_position()
	pos.x += 30.0
	pos.y += 30.0
	points[1] = pos
	pass

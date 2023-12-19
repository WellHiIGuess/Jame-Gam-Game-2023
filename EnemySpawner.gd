extends Node2D


var SPAWN_DELAY = 5.0
var spawn_delay = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	SPAWN_DELAY = get_meta('spawn_delay')
	spawn_delay = SPAWN_DELAY
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawn_delay <= 0.0:
		var enemy = get_parent().get_node('Enemy').duplicate()
		enemy.set_meta('health', get_meta('health'))
		enemy.set_meta('speed', get_meta('speed'))
		enemy.position = position
		
		get_parent().add_child(enemy)
		spawn_delay = SPAWN_DELAY
	else:
		spawn_delay -= delta
		
	pass

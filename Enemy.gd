extends CharacterBody2D

var health = 0
var SPEED = 0.0


func _ready():
	health = get_meta('health')
	SPEED = get_meta('speed')


func _process(delta):
	if health <= 0:
		queue_free()


func _physics_process(delta):
	
	var direction = (get_parent().get_node('Player').global_position - global_position).normalized()

	# Move towards the player using move_and_slide
	move_and_collide(Vector2(direction.x, 0.0) * SPEED * delta)
	move_and_collide(Vector2(0.0, direction.y) * SPEED * delta)
	
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		if collision.get_collider().has_meta('Bullet'):
			if collision.get_collider().get_meta('Bullet') == true:
				collision.get_collider().queue_free()
				health -= 1
	pass

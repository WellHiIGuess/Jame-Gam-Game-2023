extends CharacterBody2D

var health = 0
const SPEED = 300.0


func _ready():
	health = get_meta('health')


func _process(delta):
	print(health)
	
	if health <= 0:
		queue_free()


func _physics_process(delta):
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		if collision.get_collider().get_meta('Bullet') == true:
			collision.get_collider().queue_free()
			health -= 1
	pass

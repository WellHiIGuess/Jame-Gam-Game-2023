extends CharacterBody2D


const SPEED = 300.0
var BULLET_VELOCITY = 400.0

var mouse_pos = Vector2()
const SHOOT_DELAY = 1.0
var shoot_delay = 1.0

func _ready():
	var image = load("res://shooty_shooty.svg")
	Input.set_custom_mouse_cursor(image)


func _process(delta):
	var aim_pos = get_global_mouse_position()
	aim_pos.x += 30.0
	aim_pos.y += 30.0
	
	var aim_direction = (aim_pos - global_position).normalized()
	
	if aim_direction.abs().x > aim_direction.abs().y:
		print('bean')
		if aim_direction.x > 0.0:
			get_node('CollisionShape2D/Sprite2D').texture = preload('res://santa-right.svg')
		else:
			get_node('CollisionShape2D/Sprite2D').texture = preload('res://santa-left.svg')
	else:
		print('boon')
		if aim_direction.y > 0.0:
			get_node('CollisionShape2D/Sprite2D').texture = preload('res://santa-front.svg')
		else:
			get_node('CollisionShape2D/Sprite2D').texture = preload('res://santa-back.svg')
	
	if shoot_delay < SHOOT_DELAY:
		shoot_delay -= delta
	
	if shoot_delay <= 0.0:
		shoot_delay = SHOOT_DELAY
	
	if Input.is_action_pressed('click') and shoot_delay == SHOOT_DELAY:
		var bullet = get_parent().get_node('Bullet').duplicate()
		bullet.position = position
		get_parent().add_child(bullet)
		
		bullet.linear_velocity = aim_direction * BULLET_VELOCITY
		
		shoot_delay -= delta


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var move = Vector2(Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left'), Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')).normalized()
	
	move_and_collide(Vector2(move.x * SPEED * delta, 0.0))
	move_and_collide(Vector2(0.0, move.y * SPEED * delta))
	

	
func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos = event.position
		# print("Mouse Motion at: ", event.position)

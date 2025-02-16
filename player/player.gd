class_name Player extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO

@export var speed: int = 300
@export var push_force: float = 10

var rotation_speed = 1.5  # turning speed in radians/sec

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _physics_process(delta):
	# _movement_v1()
	# _movement_v2()
	_movement_v3(delta)
	pass
		
func _movement_v1():
	direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_down", "ui_up")
	)
	direction.normalized()
	velocity = direction * speed
	handle_collision()
	look_at(get_global_mouse_position())
	move_and_slide()

func _movement_v2():
	look_at(get_global_mouse_position())
	var move_input = Input.get_axis("ui_down", "ui_up")
	velocity = transform.x * move_input * speed
	handle_collision()
	move_and_slide()


func _movement_v3(delta):

	var move_input = Input.get_axis("ui_down", "ui_up")
	velocity = transform.x * move_input * speed
	var rotation_direction = Input.get_axis("ui_left", "ui_right")
	rotation += rotation_direction * rotation_speed * delta
	direction.normalized()
	velocity = transform.x * move_input * speed
	handle_collision()
	move_and_slide()

func handle_collision():
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		var collison_body = collision.get_collider()
		if collison_body is RigidBody2D:			
			collison_body.apply_central_impulse(-collision.get_normal() * push_force)

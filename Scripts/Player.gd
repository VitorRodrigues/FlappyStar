extends KinematicBody2D

const MIN_FALL_SPEED = 10
const MAX_FALL_SPEED = 400
const DOWN = Vector2(0, 1)

var jump_force = Vector2(0, -400)
var speed = MIN_FALL_SPEED

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("flap"):
		speed = -MAX_FALL_SPEED
	
	speed = min(speed + MIN_FALL_SPEED, MAX_FALL_SPEED)
	rotation_degrees = max(min(speed / MIN_FALL_SPEED, 45), -45)
	var collision = move_and_collide(DOWN * speed * delta)
	if collision != null:
		die()

func die():
	destroy()

func destroy():
	queue_free()
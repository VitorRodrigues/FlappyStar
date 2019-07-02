extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var direction = Vector2(-1, 0)
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(speed, 0) * direction * delta
	
	if position.x < - 90:
		queue_free()
	
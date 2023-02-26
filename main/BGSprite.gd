extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(speed*delta, 0)
	if speed > 0 and position.x > 156*13:
		position.x -= 156*14
	elif position.x < -156:
		position.x += 156*14

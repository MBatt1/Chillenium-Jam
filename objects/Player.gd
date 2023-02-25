extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var weight
export(int) var friction
export(int) var drag

var speed_x = 0
var speed_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_drag(speed, decrementer):
	if abs(speed) < 10:
		return 0
	elif speed > 0:
		return speed-decrementer
	else:
		return speed+decrementer

func _physics_process(delta):
	if not is_on_floor():
		speed_y += weight*delta
	else:
		if Input.is_action_pressed("ui_up"):
			speed_y = -200
	if Input.is_action_pressed("ui_right"):
		speed_x = 200
	if Input.is_action_pressed("ui_left"):
		speed_x = -200
	if not is_on_floor():
		speed_x = add_drag(speed_x,drag*delta)
	else:
		speed_x = add_drag(speed_x,friction*delta)
	var velocity = Vector2(speed_x, speed_y)
	move_and_slide(velocity, Vector2.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

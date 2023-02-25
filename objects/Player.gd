extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var weight
export(int) var friction
export(int) var drag

var speed_x = 0
var speed_y = 0
var tracking_camera
var up_control
var right_control
var down_control
var left_control

func setup(w, f, d, cam, uc, rc, dc, lc):
	weight = w
	friction = f
	drag = d
	tracking_camera = cam
	up_control = uc
	right_control = rc
	down_control = dc
	left_control = lc

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
	#if speed_x < 10:
		#$AnimatedSprite.play("default")
	if is_on_floor() and speed_x <10:
		$AnimatedSprite.play("default")
	if not is_on_floor():
		speed_y += weight*delta
	else:
		if Input.is_action_pressed(up_control):
			$AnimatedSprite.play("jump")
			speed_y = -200
	if Input.is_action_pressed(right_control):
		$AnimatedSprite.play("walk")
		speed_x = 200
	if Input.is_action_pressed(left_control):
		$AnimatedSprite.play("walk")
		speed_x = -200
	if not is_on_floor():
		speed_x = add_drag(speed_x,drag*delta)
	else:
		speed_x = add_drag(speed_x,friction*delta)
	var velocity = Vector2(speed_x, speed_y)
	move_and_slide(velocity, Vector2.UP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tracking_camera.position = position

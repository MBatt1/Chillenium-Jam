extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var weight
export(int) var friction
export(int) var drag
export(int) var speed = 200
export(int) var jump_strength = 200

signal throw

var alive = true
var speed_x = 0
var speed_y = 0
var camera_on = true
var tracking_camera
var camera_y_track = 0
var camera_y_track_speed = 30
var tracked = false
var up_control
var right_control
var down_control
var left_control
var use_control

var check = false

var possess_heart = false

func setup(w, f, d, s, j, color, cam, uc, rc, dc, lc, tc):
	weight = w
	friction = f
	drag = d
	speed = s
	jump_strength = j
	$AnimatedSprite.self_modulate = color
	tracking_camera = cam
	up_control = uc
	right_control = rc
	down_control = dc
	left_control = lc
	use_control = tc

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_drag(sp, decrementer):
	if abs(sp) < 10:
		return 0
	elif sp > 0:
		return sp-decrementer
	else:
		return sp+decrementer

func _physics_process(delta):
	if is_on_floor() and abs(speed_x) <10:
		$AnimatedSprite.play("default")
		$AnimatedSprite.flip_h = false
	if not is_on_floor():
		speed_y += weight*delta
		if Input.is_action_pressed(down_control) and alive == true:
			$AnimatedSprite.play("pound")
			speed_x = 0
			speed_y += 150
	else:
		if Input.is_action_pressed(up_control) and alive == true:
			$AnimatedSprite.play("jump")
			speed_y = -jump_strength
		else:
			speed_y = 0
	if alive == true:
		if Input.is_action_pressed(use_control) and possess_heart:
			emit_signal("throw")
			has_heart(false)
		if Input.is_action_pressed(right_control):
			$AnimatedSprite.flip_h = true
			if is_on_floor():
				$AnimatedSprite.play("walk")
			speed_x = speed
		if Input.is_action_pressed(left_control):
			$AnimatedSprite.flip_h = false
			if is_on_floor():
				$AnimatedSprite.play("walk")
			speed_x = -speed
		if not is_on_floor():
			speed_x = add_drag(speed_x,drag*delta)
		else:
			speed_x = add_drag(speed_x,friction*delta)
		var velocity = Vector2(speed_x, speed_y)
		var _result = move_and_slide(velocity, Vector2.UP)

func kill_player():
	alive = false
	$AnimatedSprite.play("death")
	$CollisionShape2D.disabled = true
	#speed = Vector2(0, -200)
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://main/Main.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if tracking_camera:
		if camera_on:
			tracking_camera.position = position
		else:
			if abs(tracking_camera.position.y - camera_y_track) < 1:
				tracking_camera.position.y = camera_y_track
				tracked = true
			elif tracking_camera.position.y < camera_y_track:
				tracking_camera.position.y += camera_y_track_speed*delta
			else:
				tracking_camera.position.y -= camera_y_track_speed*delta

func has_heart(state):
	possess_heart = state
	if state:
		$HeartSprite.visible = true
	else:
		$HeartSprite.visible = false

func end_ready_check():
	check = true




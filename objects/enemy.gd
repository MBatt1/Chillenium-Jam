extends KinematicBody2D

enum dir {
	LEFT,
	RIGHT
}

enum state {
	WALKING,
	ANGRY,
	SOBBING
}

export(int) var hits
export(int) var weight
export(int) var friction
export(int) var drag
export(int) var speed
export(dir) var move_direction
export(state) var machine

var velocity = Vector2.ZERO

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

func _process(_delta):
	$AnimatedSprite.flip_h = !move_direction
	if machine == state.WALKING:
		$AnimatedSprite.play("walk")
	elif machine == state.ANGRY:
		$AnimatedSprite.play("angry")
	elif machine == state.SOBBING:
		$AnimatedSprite.play("cry")

func _physics_process(delta):
	var speed_x = speed*(move_direction-0.5)*2*(machine*0.5+1)
	var speed_y = velocity.y
	if not is_on_floor():
		speed_y += weight*delta
	else:
		speed_y = 0
	if not is_on_floor():
		speed_x = add_drag(speed_x,drag*delta)
	else:
		speed_x = add_drag(speed_x,friction*delta)
	velocity = Vector2(speed_x, speed_y)
	var _result = move_and_slide(velocity, Vector2.UP)
	if is_on_wall():
		move_direction = int(!move_direction)

func _on_Area2D_body_entered(body):
	if "player" in body.name:
		body.kill_player()

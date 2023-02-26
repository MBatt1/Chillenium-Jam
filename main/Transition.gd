extends Node2D

signal done

var to_pos_start = -1300
var to_pos_end = -160
var from_pos_start = 860
var from_pos_end = 2000
var speed = 3000

var goal = Vector2(-35, -1300)

# Called when the node enters the scene tree for the first time.

func _process(delta):
	if $View.position.y < goal.y:
		$View.position += Vector2(0, speed)*delta
	else:
		emit_signal("done")

func transition_to():
	$View.position = Vector2(-35, to_pos_start)
	$View.scale = Vector2(1, 1)
	goal = Vector2(-35, to_pos_end)

func transition_from():
	$View.position = Vector2(-35, from_pos_start)
	$View.scale = Vector2(1, -1)
	goal = Vector2(-35, from_pos_end)


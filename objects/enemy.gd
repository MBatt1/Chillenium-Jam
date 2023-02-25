extends KinematicBody2D

export(int) var health
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed_x = 20
var speed_y = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2(speed_x,speed_y)
	move_and_slide(velocity, Vector2.UP)
	pass

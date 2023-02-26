extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sprite2_origin = 0
var sprite2_direction = 1
var speed = 10
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite2_origin = $Sprite2.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		$Sprite2.position += Vector2(0,speed*delta*sprite2_direction)

func _on_Area2D_body_entered(body):
	if "player" in body.name:
		body.end_ready_check()

func _on_Area2D_body_exited(body):
	if "player" in body.name:
		body.end_ready_check()


func _on_Timer_timeout():
	sprite2_direction *= -1

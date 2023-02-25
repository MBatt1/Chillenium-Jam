extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Resource) var template
export(int) var player_id
export(int) var weight
export(int) var friction
export(int) var drag
export(int) var speed = 200
export(int) var jump_strength = 200
export(Color) var color


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.visible = false
	pass # Replace with function body.


func spawn(level, cam):
	var copy = template.instance()
	if player_id == 0:
		copy.setup(weight, friction, drag, color, cam, "p1_up", "p1_right", "p1_down", "p1_left")
	elif player_id == 1:
		copy.setup(weight, friction, drag, color, cam, "p2_up", "p2_right", "p2_down", "p2_left")
	else:
		print("Invalid player id or no id was specified!")
	level.add_child(copy)
	copy.position = position	
	return copy

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

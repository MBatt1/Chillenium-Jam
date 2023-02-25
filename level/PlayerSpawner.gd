extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Resource) var template
export(int) var weight
export(int) var friction
export(int) var drag


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func spawn(level, cam):
	var copy = template.instance()
	copy.setup(weight, friction, drag, cam)
	level.add_child(copy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

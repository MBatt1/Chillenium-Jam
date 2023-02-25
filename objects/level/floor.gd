extends StaticBody2D

export(int) var length
export(int) var width
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var size = Vector2(length,width)
	$CollisionShape2D.get_parent().set_scale(size)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

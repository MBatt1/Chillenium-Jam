extends ReferenceRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum Type {
	DOWN_RIGHT,
	DOWN_LEFT,
	UP_RIGHT,
	UP_LEFT
}

export (Type) var type


# Called when the node enters the scene tree for the first time.
func _ready():
	var x_size = abs(margin_left-margin_right)
	var y_size = abs(margin_top-margin_bottom)
	if type == Type.DOWN_RIGHT:
		$Polygon2D.polygon[0] = Vector2(x_size, 0)
		$Polygon2D.polygon[1] = Vector2(x_size, y_size)
		$Polygon2D.polygon[2] = Vector2(0, y_size)
	elif type == Type.DOWN_LEFT:
		$Polygon2D.polygon[0] = Vector2(0, 0)
		$Polygon2D.polygon[1] = Vector2(x_size, y_size)
		$Polygon2D.polygon[2] = Vector2(0, y_size)
	elif type == Type.UP_RIGHT:
		$Polygon2D.polygon[0] = Vector2(0, 0)
		$Polygon2D.polygon[1] = Vector2(x_size, 0)
		$Polygon2D.polygon[2] = Vector2(x_size, y_size)
	elif type == Type.UP_LEFT:
		$Polygon2D.polygon[0] = Vector2(0, 0)
		$Polygon2D.polygon[1] = Vector2(x_size, 0)
		$Polygon2D.polygon[2] = Vector2(0, y_size)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

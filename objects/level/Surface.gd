extends ReferenceRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var x_size = abs(margin_left-margin_right)
	var y_size = abs(margin_top-margin_bottom)
	$ColorRect.margin_right = x_size
	$ColorRect.margin_bottom = y_size
	var new_shape = RectangleShape2D.new()
	new_shape.extents = Vector2(x_size/2, y_size/2)
	$StaticBody2D/CollisionShape2D.shape = new_shape
	$StaticBody2D/CollisionShape2D.position = Vector2(x_size/2, y_size/2)

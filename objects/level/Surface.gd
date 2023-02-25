extends ReferenceRect

export(Vector2) var speed
export(int) var x_final
export(int) var y_final
export(int) var x_offset
export(int) var y_offset
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var r_pos
var t_pos
var l_pos
var b_pos
var activate = false
#var old_position = Vector2($StaticBody2D/CollisionShape2D.position)
# Called when the node enters the scene tree for the first time.
func _ready():
	r_pos = margin_right
	l_pos = margin_left
	b_pos = margin_left
	t_pos = margin_top
	var x_size = abs(margin_left-margin_right)
	var y_size = abs(margin_top-margin_bottom)
	$ColorRect.margin_right = x_size
	$ColorRect.margin_bottom = y_size
	var new_shape = RectangleShape2D.new()
	new_shape.extents = Vector2(x_size/2, y_size/2)
	$StaticBody2D/CollisionShape2D.shape = new_shape
	$StaticBody2D/CollisionShape2D.position = Vector2(x_size/2, y_size/2)

func _physics_process(delta):
	if activate == true:
		if abs(x_offset) < x_final:
			x_offset += speed.x*delta
		if abs(y_offset) < y_final:
			y_offset += speed.y*delta
	margin_right = r_pos + x_offset
	margin_left = l_pos + x_offset
	margin_top = t_pos +y_offset
	margin_bottom = b_pos +y_offset
	

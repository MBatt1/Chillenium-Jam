extends Container

export(Resource) var sprite
var image_dimension = 1152

# Called when the node enters the scene tree for the first time.
func _ready():
	var x_pos = margin_left
	var x_end = margin_right
	var y_pos = margin_top
	var y_end = margin_bottom
	
	while x_pos < x_end:
		y_pos = MARGIN_TOP
		while y_pos < y_end:
			var img = sprite.instance()
			add_child(img)
			img.position = Vector2(x_pos, y_pos)
			y_pos += image_dimension
		var img = sprite.instance()
		add_child(img)
		img.position = Vector2(x_pos, y_pos)
		x_pos +=image_dimension
	while y_pos < y_end:
		var img = sprite.instance()
		add_child(img)
		img.position = Vector2(x_pos, y_pos)
		y_pos += image_dimension
	var img = sprite.instance()
	add_child(img)
	img.position = Vector2(x_pos, y_pos)

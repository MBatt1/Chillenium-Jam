extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for y in range(12):
		for i in range(14):
			var dupe = $Sprite.duplicate()
			add_child(dupe)
			if y % 2 == 0:
				dupe.speed *= -1
				dupe.flip_h = true
			dupe.modulate = _random_color()
			dupe.position += Vector2((i)*156, y*156)
	$Sprite.queue_free()

func _random_color():
	return Color(1,randf()*0.5,randf())

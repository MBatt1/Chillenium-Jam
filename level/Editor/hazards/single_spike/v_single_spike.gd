extends StaticBody2D

export(bool) var h_flip
export(bool) var color = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var activate = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if color == false:
		$AnimatedSprite.play("yellow")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activate == true:
		$killbox/CollisionPolygon2D.disabled = true
	else:
		$killbox/CollisionPolygon2D.disabled = false
	$AnimatedSprite.flip_h = h_flip
	
func _on_killbox_body_entered(body):
	if "player" in body.name:
		body.kill_player()

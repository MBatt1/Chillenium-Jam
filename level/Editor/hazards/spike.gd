extends StaticBody2D

export(bool) var v_flip
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var activate = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if activate == true:
		$killbox/CollisionShape2D.disabled = true
	else:
		$killbox/CollisionShape2D.disabled = false
	$Sprite.flip_v = v_flip
	
func _on_killbox_body_entered(body):
	if "player" in body.name:
		body.kill_player()

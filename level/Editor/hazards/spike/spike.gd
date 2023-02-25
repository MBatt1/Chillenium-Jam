extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var activate = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activate == true:
		$killbox/CollisionShape2D.disabled = true

func _on_killbox_body_entered(body):
	body.kill_player()
	pass # Replace with function body.

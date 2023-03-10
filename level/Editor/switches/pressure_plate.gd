extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) var connection
export(int) var poundage = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	if "player" in body.name and body.pound_state == true:
		get_node(connection).activate = true
		$AnimatedSprite.play("on")

func _on_Area2D_body_exited(body):
	if "player" in body.name:
		if get_node(connection) != null:
			get_node(connection).activate = false
		$AnimatedSprite.play("off")

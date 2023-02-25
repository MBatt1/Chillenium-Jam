extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) var connection
var on = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func switch_state():
	if $AnimatedSprite.animation == "off":
		$AnimatedSprite.play("on")
		on = true
	else:
		$AnimatedSprite.play("off")
		on = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	switch_state()
	get_node(connection).activate = true
	pass # Replace with function body.

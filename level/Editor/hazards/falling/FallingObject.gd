extends ReferenceRect

export(Vector2) var speed
export(int) var y_final
export(int) var y_offset
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var r_pos
var t_pos
var l_pos
var b_pos
var activate = false
var stop_all = false
#var old_position = Vector2($StaticBody2D/CollisionShape2D.position)
# Called when the node enters the scene tree for the first time.
func _ready():
	r_pos = margin_right
	l_pos = margin_left
	b_pos = margin_left
	t_pos = margin_top

func _physics_process(delta):
	if stop_all == false:
		if activate == true:
			if abs(y_offset) < y_final:
				y_offset += speed.y*delta
		margin_top = t_pos +y_offset
		margin_bottom = b_pos +y_offset
	else:
		speed = 0
		pass
	
func _on_Area2D_body_entered(body):
	if "player" in body.name:
		activate = true
		$trigger/triggerhitbox.disabled = true
		
func _on_kill_body_entered(body):
	if "player" in body.name and stop_all == false:
		body.kill_player()
	else:
		stop_all = true

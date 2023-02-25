extends KinematicBody2D

var possessor
var speed = 4
var turn_speed = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	rotation = _rotate_a_little(delta*turn_speed)
	var result = move_and_collide(Vector2(cos(rotation), sin(rotation))*speed)
	if result:
		print(result.collider.get_children())
		

func _desired_angle():
	return Vector2(position.x-possessor.position.x, position.y-possessor.position.y).normalized().angle()-PI


func _rotate_a_little(delta):
	var desired = _desired_angle()
	var rot = atan2(cos(rotation)*sin(desired)-cos(desired)*sin(rotation), 
			cos(rotation)*cos(desired)+sin(desired)*sin(rotation))
	var out
	if rot >= 0:
		  out = rotation + min(delta, rot)     
	else:
		  out = rotation + max(-delta, rot)  
	return out


extends KinematicBody2D

signal player_impact(target)

var homing_target
var speed = 6
var turn_speed = 9


func _physics_process(delta):
	if _distance_to_target() != 0:
		var dist_turn_speed = (turn_speed*60/_distance_to_target())
		rotation = _rotate_a_little(delta*dist_turn_speed)
	var result = move_and_collide(Vector2(cos(rotation), sin(rotation))*speed)
	if result:
		if "player" in result.collider.name:
			emit_signal("player_impact", result.collider)
		elif "enemy" in result.collider.name:
			result.collider.die()
		

func _desired_angle():
	return Vector2(position.x-homing_target.x, position.y-homing_target.y).normalized().angle()-PI


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


func _distance_to_target():
	return Vector2(position.x-homing_target.x, position.y-homing_target.y).length()
	

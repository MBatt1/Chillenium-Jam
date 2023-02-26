extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Transition.transition_from()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button1_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	Global.desired_stage = Global.stage1
	get_tree().change_scene("res://main/Main.tscn")


func _on_Button2_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	Global.desired_stage = Global.stage2
	get_tree().change_scene("res://main/Main.tscn")


func _on_Button3_pressed():
	pass # Replace with function body.


func _on_Button4_pressed():
	pass # Replace with function body.


func _on_Button5_pressed():
	pass # Replace with function body.

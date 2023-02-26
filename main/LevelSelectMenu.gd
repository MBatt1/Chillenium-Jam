extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$bgm.play(Global.song_position)
	$Transition.transition_from()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button1_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	Global.desired_stage = Global.stage1
	var _ignore = get_tree().change_scene("res://main/Main.tscn")


func _on_Button2_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	Global.desired_stage = Global.stage2
	var _ignore = get_tree().change_scene("res://main/Main.tscn")


func _on_Button3_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	Global.desired_stage = Global.stage3
	var _ignore = get_tree().change_scene("res://main/Main.tscn")

func _on_Button5_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	Global.desired_stage = Global.stage5
	var _ignore = get_tree().change_scene("res://main/Main.tscn")


func _on_Button6_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	Global.song_position = $bgm.get_playback_position()
	var _ignore = get_tree().change_scene("res://main/MainMenu.tscn")

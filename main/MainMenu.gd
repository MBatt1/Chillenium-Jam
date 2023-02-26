extends Node2D

func _on_PlayButton_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	change_scene("res://main/LevelSelectMenu.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()

func change_scene(target):
	var _ignore = get_tree().change_scene(target)

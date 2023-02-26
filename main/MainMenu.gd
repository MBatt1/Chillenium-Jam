extends Node2D

var logo1_y
var logo2_y

func _on_PlayButton_pressed():
	$Transition.transition_to()
	yield($Transition, "done")
	Global.song_position = $bgm.get_playback_position()
	change_scene("res://main/LevelSelectMenu.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()

func change_scene(target):
	var _ignore = get_tree().change_scene(target)

func _ready():
	logo1_y = $Sprite.position.y
	logo2_y = $Sprite2.position.y
	$bgm.play(Global.song_position)
	if Global.song_position != 0:
		$Transition.transition_from()

func _process(delta):
	pass


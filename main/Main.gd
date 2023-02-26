extends Node2D

var heart_res = preload("res://objects/projectile/Heart.tscn")

export(Resource) var level_template
var level
var player1
var player2
var heart
var heart_target
var heart_side
var gameover = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.desired_stage:
		level = Global.desired_stage.instance()
	else:
		level = level_template.instance()
	$Transition.transition_from()
	$LVC/Viewport.add_child(level)
	$RVC/Viewport.world_2d = $LVC/Viewport.world_2d
	var spawns = level.get_player_spawns()
	player1 = spawns[0].spawn(level, $LVC/Viewport/Cam)
	player2 = spawns[1].spawn(level, $RVC/Viewport/Cam)
	player1.connect("throw", self, "_on_p1_throw")
	player2.connect("throw", self, "_on_p2_throw")
	player1.connect("death",self, "_on_p_death")
	player2.connect("death",self, "_on_p_death")
	heart = heart_res.instance()
	level.add_child(heart)
	heart_target = level.heart_start
	heart_side = 0
	_process(0)
	heart.connect("player_impact", self, "_on_player_impact")
	$LVC/Viewport/Cam.make_current()
	$RVC/Viewport/Cam.make_current()
	$sm.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not $sm.playing:
		$sm.play(0)
	position = Vector2((get_viewport().size.x-1280)/2, 0)
	if Input.is_action_pressed("ui_cancel"):
		$Transition.transition_to()
		yield($Transition, "done")
		var _ignore = get_tree().change_scene("res://main/LevelSelectMenu.tscn")
	check_end()
	$HeartSprite.position = _fake_heart_position()
	$HeartSprite.rotation = heart.rotation-PI/2
	if player1.tracked or player2.tracked:
			$Frame/Center.visible = false
	elif $Timer.is_stopped() and -($LVC/Viewport/Cam.position.x-$RVC/Viewport/Cam.position.x) <= 640:
		$RVC/Viewport/Cam.position.x = $LVC/Viewport/Cam.position.x+640
		player1.camera_on = false
		player2.camera_on = false
		var avg_y = ($RVC/Viewport/Cam.position.y + $LVC/Viewport/Cam.position.y)/2
		player1.camera_y_track = avg_y
		player2.camera_y_track = avg_y
		
	if heart_target == 0:
		if player1.tracked or player2.tracked:
			heart.homing_target = player1.position
		elif heart_side == 0:
			heart.homing_target = $LVC/Viewport/Cam.position
		else:
			heart.homing_target = $RVC/Viewport/Cam.position - Vector2(640, 0)
			
	elif heart_target == 1:
		if player1.tracked or player2.tracked:
			heart.homing_target = player2.position
		elif heart_side == 0:
			heart.homing_target = $LVC/Viewport/Cam.position + Vector2(640, 0)
		else:
			heart.homing_target = $RVC/Viewport/Cam.position
	
	
func _physics_process(_delta):
	sided_heart()


func _on_player_impact(player):
	if $Timer2.is_stopped():
		player.has_heart(true)
		heart.get_node("CollisionShape2D").disabled = true
		$HeartSprite.visible = false


func _on_p1_throw():
	$Timer.start()
	$Timer2.start()
	$HeartSprite.visible = true
	heart_target = 1
	heart.position = player1.position
	heart.rotation = Vector2(100, player1.speed_y).angle()
	_process(0)

	
func _on_p2_throw():
	$Timer.start()
	$Timer2.start()
	$HeartSprite.visible = true
	heart_target = 0
	heart.position = player2.position
	heart.rotation = Vector2(-100, player2.speed_y).angle()
	_process(0)


func _on_Timer_timeout():
	heart.get_node("CollisionShape2D").disabled = false


func sided_heart():
	var heart_pos = heart.position
	var l_cam_pos = $LVC/Viewport/Cam.position
	var r_cam_pos = $RVC/Viewport/Cam.position
	if heart_target == 0 and heart_side == 1 and r_cam_pos.x-heart_pos.x>=320:
		heart.position.x = l_cam_pos.x+(r_cam_pos.x-heart_pos.x)
		heart.position.y -= r_cam_pos.y-l_cam_pos.y
		heart_side = 0
	if heart_target == 1 and heart_side == 0 and heart_pos.x-l_cam_pos.x>=320:
		heart.position.x = r_cam_pos.x-(heart_pos.x-l_cam_pos.x)
		heart.position.y += r_cam_pos.y-l_cam_pos.y
		heart_side = 1


func _fake_heart_position():
	if heart_side == 0:
		var l_cam_top_left = $LVC/Viewport/Cam.position-Vector2(320, 360)
		return heart.position - l_cam_top_left
	else:
		var r_cam_top_left = $RVC/Viewport/Cam.position-Vector2(320, 360)
		return heart.position - r_cam_top_left + Vector2(640, 0)

func _on_p_death():
	$Transition.transition_to()
	yield($Transition, "done")


func check_end():
	if player1.check and player2.check and not gameover:
		gameover = true
		$HeartSprite.visible = true
		heart_target = -1
		yield(get_tree().create_timer(4), "timeout")
		$Transition.transition_to()
		yield($Transition, "done")
		var _ignore = get_tree().change_scene("res://main/LevelSelectMenu.tscn")
		


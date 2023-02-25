extends Node2D

var heart_res = preload("res://objects/projectile/Heart.tscn")

export(Resource) var level_template
var level
var player1
var player2
var heart

# Called when the node enters the scene tree for the first time.
func _ready():
	level = level_template.instance()
	$LVC/Viewport.add_child(level)
	resize_viewports()
	var spawns = level.get_player_spawns()
	player1 = spawns[0].spawn(level, $LVC/Viewport/Cam)
	player2 = spawns[1].spawn(level, $RVC/Viewport/Cam)
	heart = heart_res.instance()
	level.add_child(heart)
	if level.heart_start == 0:
		heart.possessor = player1
	else:
		heart.possessor = player2
	$LVC/Viewport/Cam.make_current()
	$RVC/Viewport/Cam.make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player1.tracked or player2.tracked:
			$Frame/Center.visible = false
	elif $Timer.is_stopped() and -($LVC/Viewport/Cam.position.x-$RVC/Viewport/Cam.position.x) <= 640:
		$RVC/Viewport/Cam.position.x = $LVC/Viewport/Cam.position.x+640
		player1.camera_on = false
		player2.camera_on = false
		var avg_y = ($RVC/Viewport/Cam.position.y + $LVC/Viewport/Cam.position.y)/2
		player1.camera_y_track = avg_y
		player2.camera_y_track = avg_y
	

func resize_viewports():
	var width = get_viewport().size.x/2
	var height = get_viewport().size.y
	$RVC/Viewport.world_2d = $LVC/Viewport.world_2d




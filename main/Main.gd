extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Resource) var level_template
var level

# Called when the node enters the scene tree for the first time.
func _ready():
	level = level_template.instance()
	$LVC/Viewport.add_child(level)
	resize_viewports()
	var spawns = level.get_player_spawns()
	spawns[0].spawn(level, $RVC/Viewport/Cam)
	#$LVC/Viewport/Level/PlayerSpawner.spawn($LVC/Viewport/Level, $RVC/Viewport/Cam)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$LVC/Viewport/Cam.make_current()
	$RVC/Viewport/Cam.make_current()
	$RVC/Viewport/Cam.position += Vector2(0, 1)


func resize_viewports():
	var width = get_viewport().size.x/2
	var height = get_viewport().size.y
	
	$LVC/Viewport.world_2d = get_viewport().world_2d
	$RVC/Viewport.world_2d = $LVC/Viewport.world_2d

	
	

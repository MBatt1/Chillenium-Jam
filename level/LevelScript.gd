extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_player_spawns():
	var all_children = get_children()
	var spawners = []
	for i in range(all_children.size()):
		if "PlayerSpawner" in all_children[i].name:
			spawners.append(all_children[i])
	return spawners

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

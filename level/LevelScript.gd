extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var heart_start

func get_player_spawns():
	var all_children = get_children()
	var spawners = []
	for i in range(all_children.size()):
		if "PlayerSpawner" in all_children[i].name:
			spawners.append(all_children[i])
	return spawners

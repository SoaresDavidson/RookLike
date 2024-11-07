extends Node2D
class_name InstantiatorSquares

var scene:PackedScene = preload("res://Scenes/chessSquare.tscn")

func spawn(global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	var instance = scene.instantiate()
	
	
	parent.call_deferred("add_child",instance)
	instance.global_position = global_spawn_position
	

	return instance

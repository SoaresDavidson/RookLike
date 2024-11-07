extends Node2D
class_name InstantiatePieces

#@export var scene:PackedScene


func spawn(piece:PackedScene,global_spawn_position: Vector2 = global_position, parent: Node = self.get_parent()) -> Node:
	assert(piece is PackedScene, "Error: The scene export was never set on this spawner component.")
	var instance = piece.instantiate()
	
	parent.add_child(instance)
	instance.global_position = global_spawn_position

	return instance

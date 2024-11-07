extends Node2D

const DISTANCE = 65
const ORIGIN = Vector2(72,72)
var coordinates = null
var is_dragging = false
var board = []


func _ready() -> void:
	var rows = 8
	var cols = 8
	for i in range(rows):
		var x = []
		for j in range(cols):
			x.append(null)
		board.append(x)

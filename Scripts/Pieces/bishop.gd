extends Piece

var multipliers = [1, 2, 3, 4, 5, 6, 7]
var positions = [64,-64]

func _ready() -> void:
	connect("dragging",spawnSquares)

func spawnSquares():
	bishopMove()
	moves += 1

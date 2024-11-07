extends Piece
#
#var moveOneSquare = [64, -64]
#var moveTwoSquare = [128,-128]
func _ready() -> void:
	connect("dragging",spawnSquares)
	
		
func spawnSquares():
	knightMove()
	#updatePosition()
	moves += 1

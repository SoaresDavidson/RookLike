extends Piece


func _ready() -> void:
	connect("dragging",spawnSquares)
	
		
func spawnSquares():
	bishopMove()
	rookMove()
	moves += 1

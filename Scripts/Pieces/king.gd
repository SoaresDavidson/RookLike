extends Piece


func _ready() -> void:
	connect("dragging",spawnSquares)
	
		
func spawnSquares():
	for i in [64,-64]:
		for j in [64,-64]:
			if inBoard(Vector2(initialPos.x+i,initialPos.y+j)): $Instantiator.spawn(Vector2(initialPos.x+i, initialPos.y+j))
			if inBoard(Vector2(initialPos.x+i,initialPos.y)): $Instantiator.spawn(Vector2(initialPos.x+i, initialPos.y))
			if inBoard(Vector2(initialPos.x,initialPos.y)): $Instantiator.spawn(Vector2(initialPos.x, initialPos.y+j))
	
	moves += 1

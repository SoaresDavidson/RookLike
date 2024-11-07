extends Piece


func _ready() -> void:
	connect("dragging",spawnSquares)
	
		
func spawnSquares():
	if initialPos.y-64 > 40:
		$Instantiator.spawn(Vector2(initialPos.x,initialPos.y-64))
	if moves == 0:
		$Instantiator.spawn(Vector2(initialPos.x,initialPos.y-128))
